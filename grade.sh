CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

#ADD MORE COMMENTS BELOW TO HELP READERS UNDERTSTAND PROCESSES

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
    then 
        echo "listExamples found"
    else 
        echo "listExamples not found"
        exit 1
fi

#copied testing files to this directory
cp ../TestListExamples.java ./
cp -r ../lib ./

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

if [[ $? -eq 0 ]]
    then 
        echo "Program compiled"
    else 
        echo "Program did not compile"
        exit 1
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > output.txt
grep "Failures" output.txt


