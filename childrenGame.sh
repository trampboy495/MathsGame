#!/bin/bash 
declare -A dict 
declare -a array
function combinationGenerator() {
	for i in {0..10}; do
		limit=$((10-$i))
		for (( j=0; j<=$limit; j++ )); do
			dict[$i]="${dict[$i]}$(($j+$i)) "
		done
	done
}
playGame() {
	read -p "how many questions you want" n
	count=0
	while [[ $count -lt $n ]]; do
		i=$(( $RANDOM % 11 ))
		printf -v array_cmd "%q=( %s )" "array" "${dict[$i]}"
		eval "$array_cmd"
		j=$(( $RANDOM % ${#array[*]} ))
		echo "$i + $j =__ "
		read -p "enter your answer" a
		[[ $a -eq ${array[$j]} ]] && { echo "correct";} || { echo "wrong";}
		((count++))
	done
} 
combinationGenerator
playGame
