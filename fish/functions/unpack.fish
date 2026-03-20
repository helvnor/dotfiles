function unpack
  if not set -q argv[1]
    echo "Usage: unpack <filename>"
    return 1
  end

  set filename $argv[1]
  set encrypted_file "$filename.tar.gz.age"

  if not test -f $encrypted_file
    echo "Error: Encrypted file '$encrypted_file' does not exist."
    return 1
  end

  mkdir -p $filename
  pushd $filename
  age -d -o - ../$encrypted_file | tar -xzvf -
  set status_code $status
  popd

  if test $status_code -eq 0
    echo "Successfully decrypted and extracted archive: $encrypted_file"
  else
    echo "Error: Failed to decrypt and extract archive."
    rm -rf $filename
    return 1
  end
end

