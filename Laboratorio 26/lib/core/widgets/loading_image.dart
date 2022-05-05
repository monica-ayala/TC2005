part of 'widgets.dart';

class LoadingImage extends StatelessWidget {
  final String imageSource;
  final Widget? child;
  final bool roundedBorders;
  const LoadingImage({
    Key? key,
    required this.imageSource,
    this.child,
    this.roundedBorders = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (child != null) {
        return Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.hardEdge,
          fit: StackFit.expand,
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: FadeInImage(
                fit: BoxFit.cover,
                image: Image.network(imageSource).image,
                placeholder: Image.asset("assets/jar-loading.gif").image,
              ),
            ),
            child!
          ],
        );
      } else {
        if (roundedBorders) {
          return ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: FadeInImage(
              alignment: Alignment.center,
              width: double.infinity,
              fit: BoxFit.cover,
              image: Image.network(imageSource).image,
              placeholder: Image.asset("assets/jar-loading.gif").image,
            ),
          );
        }
        return ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(kBorderRadius),
              topRight: Radius.circular(kBorderRadius)),
          child: FadeInImage(
            alignment: Alignment.center,
            width: double.infinity,
            fit: BoxFit.cover,
            image: Image.network(imageSource).image,
            placeholder: Image.asset("assets/jar-loading.gif").image,
          ),
        );
      }
    });
  }
}
