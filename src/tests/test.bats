setup() {
  if ! command -v bc &> /dev/null; then
    sudo apt install bc
  fi
}

@test "1: Get the 1000th digit of pi" {
    # https://stackoverflow.com/a/23524782
    pi=$(echo "scale=1000; 4*a(1)" | bc -l;)
    last_digit=${pi: -1}
    [[ $last_digit == "8" ]]
}

@test "2: Wait 2 seconds" {
    start=$(date +%s)
    sleep 2
    end=$(date +%s)
    [[ $((end - start)) -ge 2 ]]
}

@test "3: Add random sleep between 1-5 seconds" {
    start=$(date +%s)
    sleep $((RANDOM % 5 + 1))
    end=$(date +%s)
    [[ $((end - start)) -ge 1 ]]
}