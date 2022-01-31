import 'package:social_media/Models/story_model.dart';
import 'package:social_media/Models/user_model.dart';

final User user = User(
    name: 'John Doe',
    profileImageUrl:
        'https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg');

final List<Story> stories = [
  Story(
    media: MediaType.image,
      user: user,
      url:
          'https://www.helpguide.org/wp-content/uploads/young-woman-eating-fast-food-chicken-sandwich-768.jpg',
      duration: const Duration(seconds: 5)),
  Story(
    media: MediaType.image,
      user: user,
      url:
          'https://media.overstockart.com/optimized/cache/data/product_images/VG485-1000x1000.jpg',
      duration: const Duration(seconds: 5)),
  Story(
    media: MediaType.image,
      user: user,
      url:
          'https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg',
      duration: const Duration(seconds: 5)),
  Story(
    media: MediaType.image,
      user: user,
      url:
          'https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg',
      duration: const Duration(seconds: 5)),
  Story(
    media: MediaType.image,
    
      user: user,
      url:
          'https://cdn.britannica.com/94/125794-050-FB09B3F4/Hikers-Gore-Range-Mountains-Denver.jpg',
      duration: const Duration(seconds: 5)),
     
];
