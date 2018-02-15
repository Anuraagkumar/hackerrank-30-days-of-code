#!/bin/bash

echo "Which day would you like to test?"
read TEST_DIR

cd $TEST_DIR

# TODO: Test multiple test cases
TEST_INPUTS=$(find . -name "test-*-input.txt")
TEST_NUM=0
for TEST_INPUT in $TEST_INPUTS
do
    ACTUAL_OUTPUT=$(cat $TEST_INPUT | python3 solution.py)
    TEST_DIFF=$(diff <(echo "$ACTUAL_OUTPUT") test-$TEST_NUM-output.txt)

    if [ $? -ne "0" ]; then
        echo "Test $TEST_NUM FAILED"
        echo "$TEST_DIFF"
        exit 1
    else
        echo "TEST $TEST_NUM PASSED"
    fi

    TEST_NUM=$((TEST_NUM+1))

done
