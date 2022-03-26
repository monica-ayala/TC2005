const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const path = require('path');
const cookieParser = require('cookie-parser');
const csrf = require('csurf');
const csrfProtection = csrf();

const scienceruta = require('./routes/science.routes');
const mathruta = require('./routes/math.routes');
const rutas_users = require('./routes/user.routes');

const app = express();

app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({extended: false}));

app.use(cookieParser());
app.use(session({
    secret: "un secreto shh",
    resave: false,
    saveUninitialized:false,
}))
app.use(csrfProtection); 

app.use((request, response, next) => {
    response.locals.csrfToken = request.csrfToken();
    next();
});

app.use('/science', scienceruta);
app.use('/math', mathruta);
app.use('/users', rutas_users);


app.use((request, response, next) => {
    response.redirect('/users');
    next();
});


app.use((request, response, next) => {
    console.log('Otro middleware!');
    response.send('Aquí no hay nada'); //Manda la respuesta
});

app.listen(3000);


