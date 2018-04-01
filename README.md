# MI-AFP homework #06

Homework to practice IO basics, testing, and project documentation

## Task

This time your will work on a "half-done" smaller project called *SELF-TESTER*.

1. **CLI** = your task is implement command line interface so user can do a self-test in console interactively. First you need to explore the code a bit and then implement `Tester.CLI` (some requirements are there in comments). The test should be loaded from a JSON file (using [aeson](https://hackage.haskell.org/package/aeson) library, see `Tester.Model.AesonInstances`), the file is provided via argument. There are also some behavioral options... Then the interaface should ask questions and show results. **No tests are provided**. You can run the CLI with `stack exec selftester` (after `stack build`). Since there are no tests, you can use your creativity as well as improve given modules as you need.
2. **Tests** = second task is to write tests using [HSpec](https://hspec.github.io) and also its integration with [QuickCheck](https://hspec.github.io/quickcheck.html) for testing properties. Tests dependencies has to be specified by you. You can get some inspiration from previous homeworks. Everything should be tested... If you find some problems, fix them. We will try to make faulty implementations and check if those will or won't pass your tests.
3. **Documentation** = final task is to write Haddock documentation for `Tester` modules - keep it short and clear... but complete!

## Notes

 * In case of uncertainty, check the [dummy homework](https://github.com/MI-AFP/hw00) to recall what is the homework workflow for this course.
 * If you encounter some trouble, create an issue in your repository.
 * In case you find a bug or have an idea how to improve assignment project, create an issue or PR in this repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for more details.
