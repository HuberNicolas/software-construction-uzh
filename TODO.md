# TODO

Open tasks before the repository is made public. See also [Known issues](README.md#known-issues).

## 1. Clean-up

- [x] Tag the submitted state as `v1.0.0` (commit "Merge branch 'master'", 23 December 2020); the commits from
  February 2021 only add and revert a screenshot
- [x] Remove the IntelliJ project files (`.idea/`)
- [x] Remove the duplicate `UML_adapter.jpg` in assignment 3 and the old CompanySystem UML that a revert brought back
- [x] Remove draft diagrams and older image exports that `ANSWERS.md` does not use
- [x] Rename the folders `SoftCon2020_Assignment_N` to `assignment-N`
- [x] Use relative image links in `ANSWERS.md`
- [x] Keep the assignment text in `assignment-6/ShoppingSW/ClassSelection.PNG`: it shows our markings (first step of
  the responsibility-driven design)
- [x] Keep the branch `repeating-user-inputs-(no-exceptions)`: it is merged, but it shows how the work was done

## 2. Build

- [x] Add `build.sh`: compiles all projects and runs the JUnit 4 and 5 tests (tested with JDK 15 and 21)
- [ ] Play a full game of Battleship (assignments 2 and 3) in a terminal; only ship placement was tried

## 3. Documentation

- [x] Rewrite the README (it described a Node.js project and a GPLv3 license file that did not exist)
- [ ] Add the lecturer and the research group of the course to the README

## 4. Before publishing

- [x] Choose and add a license (MIT, all three authors)
- [x] Add the course context (course, institution, semester, group) to the README
- [x] Get the consent of Louis Huber and Robin Wassink
- [x] Rename the GitHub repository to `software-construction-uzh`, then
  `git remote set-url origin git@github.com:HuberNicolas/software-construction-uzh.git`
- [x] Rewrite the private commit e-mail addresses of the co-authors to their GitHub noreply addresses with a mailmap
  (dates and content stay the same; backup: `_archive/swc-group38-before-filter-repo.bundle`)
- [x] Force-push `master`, the branch `repeating-user-inputs-(no-exceptions)` and the tags (`Final-V1`, `v1.0.0`, `v1.1.0`); create the releases `v1.0.0` ("As submitted") and `v1.1.0`
- [x] Check for secrets in the files and the git history, right before publishing (none found)
