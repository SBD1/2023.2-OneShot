# Open the file in read mode and read lines
with open('aux.txt', 'r') as file:
    lines = file.readlines()

# Reverse the lines list
lines = lines[::-1]

# Open the file in write mode and write the reversed lines
with open('aux2.txt', 'w') as file:
    file.writelines(lines)