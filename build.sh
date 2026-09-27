#!/usr/bin/env bash
# Compile every assignment and run the JUnit tests (assignments 4 and 5).
# Needs a JDK (the course used Java 14/15) and curl. The JUnit jars are
# downloaded once from Maven Central into lib/. Class files go to out/.
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p lib out

JARS=(
  https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.7.0/junit-platform-console-standalone-1.7.0.jar
  https://repo1.maven.org/maven2/junit/junit/4.13.1/junit-4.13.1.jar
  https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar
)
for url in "${JARS[@]}"; do
  [ -f "lib/$(basename "$url")" ] || curl -sSfL -o "lib/$(basename "$url")" "$url"
done
CP="lib/junit-platform-console-standalone-1.7.0.jar:lib/junit-4.13.1.jar:lib/hamcrest-core-1.3.jar"

for src in $(find assignment-* -type d -name src | sort); do
  project=$(dirname "$src")
  echo "=== $project"
  rm -rf "out/$project"
  mkdir -p "out/$project"
  javac -encoding UTF-8 -nowarn -cp "$CP" -d "out/$project" $(find "$project" -name '*.java')
  if [ -d "$project/test" ]; then
    java -jar lib/junit-platform-console-standalone-1.7.0.jar \
      -cp "out/$project:lib/junit-4.13.1.jar:lib/hamcrest-core-1.3.jar" \
      --scan-classpath --disable-banner --details=summary
  fi
done
