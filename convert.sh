#!/bin/bash

# Check if PuTTYgen is installed
if ! command -v puttygen >/dev/null; then
  echo "PuTTYgen is not installed. Please install PuTTYgen from here https://www.puttygen.com/ and try again."
  exit 1
fi

# Get the directory containing the PPK files
current_dir=$(pwd)

# Iterate through all files in the directory
for file in "$current_dir"/*.ppk; do

  # Convert the PPK file to private key
  puttygen "$file" -O private-openssh -o "$filename"

  # Convert the PPK file to public key
  puttygen "$file" -O public-openssh -o "$filename.pub"

  # Set correct permissions on the private key
  chmod 500 "$filename"
done
