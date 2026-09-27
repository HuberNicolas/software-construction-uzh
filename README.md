<div align="center">

# Software Construction

**Coursework for Software Construction at the University of Zurich, Fall 2020**

![Java](https://img.shields.io/badge/Java-15-ED8B00?logo=openjdk&logoColor=white)
![JUnit](https://img.shields.io/badge/JUnit-4%20%7C%205-25A162?logo=junit5&logoColor=white)
![draw.io](https://img.shields.io/badge/draw.io-F08705?logo=diagramsdotnet&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow)

[Contents](#contents) · [Getting started](#getting-started) · [Known issues](#known-issues) · [Release as submitted](https://github.com/HuberNicolas/software-construction-uzh/releases/tag/v1.0.0)

</div>

Six group assignments from the Software Construction course: reverse engineering an open-source Java project with
architecture diagrams, call graphs and flowcharts, a Battleship game, and small Java systems that apply design patterns
(Singleton, Observer, Iterator, Strategy, Composite, Decorator, MVC), unit tests with JUnit, and responsibility-driven
design with CRC cards.

> [!NOTE]
> This is unofficial study material. The code and answers are shown as we submitted them in 2020: they are not
> corrected, and the repository is not developed further. The assignment sheets are not included. We worked in the
> course repository `swc-group38` (group 38), which was later renamed to `software-construction-uzh`.

## Course

| | |
|---|---|
| Course | Software Construction (lecture and exercises) |
| Institution | Department of Informatics, University of Zurich |
| Semester | Fall 2020 |
| Group | 38 |

## Contents

Each assignment folder has an `ANSWERS.md` with our write-up and the diagrams. The Java projects keep their sources
in `src/` and their tests in `test/`.

| Assignment | Topics | Write-up | Code |
|---|---|---|---|
| [1](assignment-1/) | Reverse engineering of [vis-ui](https://github.com/kotcrab/vis-ui): package architecture, call graph of the USL command line tool, flowcharts of six lexer and parser functions | [ANSWERS.md](assignment-1/ANSWERS.md) | – |
| [2](assignment-2/) | Battleship: placing ships on the board with input validation; UML class diagram of `vis-ui` `ui/util/adapter` | [ANSWERS.md](assignment-2/ANSWERS.md) | [src](assignment-2/src/) |
| [3](assignment-3/) | Battleship against the computer with the Singleton, Observer and Iterator patterns | [ANSWERS.md](assignment-3/ANSWERS.md) | [src](assignment-3/src/) |
| [4](assignment-4/) | Bank management system (customers, employees, technicians) and JUnit tests | [ANSWERS.md](assignment-4/ANSWERS.md) | [src](assignment-4/src/), [test](assignment-4/test/) |
| [5](assignment-5/) | Airport shuttle service with the Strategy pattern; bakery chain with the Singleton, Composite and Decorator patterns | [AirportShuttleService](assignment-5/AirportShuttleService/ANSWERS.md), [Bakery](assignment-5/Bakery/ANSWERS.md) | [AirportShuttleService](assignment-5/AirportShuttleService/src/), [Bakery](assignment-5/Bakery/src/) |
| [6](assignment-6/) | Company system with the MVC pattern; responsibility-driven design of an online shop with CRC cards and a class diagram | [CompanySystem](assignment-6/CompanySystem/ANSWERS.md), [ShoppingSW](assignment-6/ShoppingSW/ANSWERS.md) | [CompanySystem](assignment-6/CompanySystem/src/) |

The diagrams were drawn with [draw.io](https://www.drawio.com/). Each figure has its `.drawio` source next to the
exported image, except for a few figures that were only exported.

## Getting started

We wrote the code in IntelliJ IDEA with Java 14/15 and without a build tool. [build.sh](build.sh) compiles every
project with `javac` and runs the JUnit tests of assignments 4 and 5. It downloads the JUnit jars from Maven Central
into `lib/` on the first run and writes the class files to `out/`.

You need a JDK and curl, or Docker. The script was tested with JDK 15 and JDK 21.

1. Clone the repository:

   ```bash
   git clone https://github.com/HuberNicolas/software-construction-uzh.git
   ```

   ```bash
   cd software-construction-uzh
   ```

2. Compile everything and run the tests with your local JDK:

   ```bash
   ./build.sh
   ```

   Or run the same script in a container with JDK 15:

   ```bash
   docker run --rm -v "$PWD":/code -w /code adoptopenjdk:15-jdk-hotspot ./build.sh
   ```

3. Run a program, for example the bakery of assignment 5:

   ```bash
   java -cp out/assignment-5/Bakery Main
   ```

| Program | Main class | Class path |
|---|---|---|
| Battleship (placing ships) | `Main` | `out/assignment-2` |
| Battleship against the computer | `Main` | `out/assignment-3` |
| Bank management system | `Main` | `out/assignment-4` |
| Airport shuttle service | `Main` | `out/assignment-5/AirportShuttleService` |
| Bakery chain | `Main` | `out/assignment-5/Bakery` |
| Company system (MVC) | `MVCPatternDemo` | `out/assignment-6/CompanySystem` |

Battleship is interactive: enter the start and end field of a ship as in `A1 A5`, and a shot as in `B3`. Run it in a
terminal (with `docker run -it` in Docker).

## Known issues

- Battleship opens a new `Scanner` for every input. When stdin is closed or piped at once (for example
  `java Main < moves.txt`), it repeats the prompt forever. Type the input in a terminal instead.
- The tests mix JUnit 4 (assignment 4) and JUnit 5 (assignment 5). `build.sh` runs both with the JUnit Platform
  console launcher and the vintage engine.
- Answers and code may be wrong or incomplete in places. They are left as submitted.

## Authors

- Nicolas Huber ([@HuberNicolas](https://github.com/HuberNicolas))
- Louis Huber ([@L-Huber](https://github.com/L-Huber))
- Robin Wassink ([@wasibo](https://github.com/wasibo))

We worked on all assignments together.

## Acknowledgements

The course Software Construction (Fall 2020) was taught at the Department of Informatics of the University of
Zurich. The assignment tasks come from the course. Assignments 1 and 2 analyse
[vis-ui](https://github.com/kotcrab/vis-ui) by Kotcrab (Apache License 2.0); its code is not part of this
repository.

## License

The code and write-ups are licensed under the [MIT License](LICENSE). The assignment text shown in
[ClassSelection.PNG](assignment-6/ShoppingSW/ClassSelection.PNG) belongs to the course.
