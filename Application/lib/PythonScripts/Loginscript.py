import sys

# Predefined email and password for authentication
valid_email = "deco@uqconnect.edu.au"
valid_password = "3500"

# Get email and password from command-line arguments
if len(sys.argv) != 3:
    sys.exit(1)

input_email = sys.argv[1]
input_password = sys.argv[2]

# Check if the provided email and password match the valid ones
if input_email == valid_email and input_password == valid_password:
    sys.exit(0)
else:

    sys.exit(1)
