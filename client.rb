# This ruby program for encryption and decryption of string using openssl
require 'openssl'
require 'digest/sha1'

# create the cipher for encrypting
cipher = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
cipher.encrypt

# you will need to store these for later, in order to decrypt your data
key = Digest::SHA1.hexdigest("yourpass")
iv = cipher.random_iv

# load them into the cipher
cipher.key = key
cipher.iv = iv

# encrypt the message
encrypted = cipher.update('This is a secure message, preparing for clint.')
encrypted << cipher.final
puts "encrypted: #{encrypted}\n"

# now we create a sipher for decrypting
cipher = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
cipher.decrypt
cipher.key = key
cipher.iv = iv

# and decrypt it
decrypted = cipher.update(encrypted)
decrypted << cipher.final
puts "decrypted: #{decrypted}\n"