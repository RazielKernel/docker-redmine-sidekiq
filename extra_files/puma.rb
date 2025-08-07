# Set the number of threads Puma will use.
# The first number is the minimum, the second is the maximum.
threads 5, 16

# Standard settings for port and environment
port        3000
environment 'production'

# Allows Puma to be restarted by creating a tmp/restart.txt file
plugin :tmp_restart
