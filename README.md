Sample project for talk on golden tests for Flutter Festival Germany 30.03.2022


## Slides
**[Link to slides](https://docs.google.com/presentation/d/18kjzydw4HFFFBoCk755ZCAycGt55PbNwwh7_9EAAivo/edit?usp=sharing)**

## Video
**[Link to video](https://youtu.be/DDgsMGFFGik?t=5925)**

## Description
- This project uses the flutter sample app (`flutter create -t skeleton`) to showcase different ways of running golden tests
- The vanilla/imperative way is shown in `tests/vanilla_imperative_approach`
- A declarative approach to golden tests with the package [Alchemist](https://pub.dev/packages/alchemist) is shown in `test/alchemist_sample_golden_test.dart`and `test/app_golden_test.dart`

- Golden tests can be run like every other test using `flutter test`
- Updating the golden master image files is achieved by running `flutter test` with an additional option: `flutter test --update-goldens`