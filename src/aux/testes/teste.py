# Ask the user for the initial counter number
counter = int(input("Enter the initial counter number: "))

# Open the file in read mode and read lines
with open('aux.txt', 'r') as file:
    lines = file.readlines()

# Go through each line and replace 'NULL' with the counter number
for i in range(len(lines)):
    if 'NULL' in lines[i]:
        lines[i] = lines[i].replace('NULL', str(counter))
        counter += 1

# Open the file in write mode and write the modified lines
with open('aux2.txt', 'w') as file:
    file.writelines(lines)