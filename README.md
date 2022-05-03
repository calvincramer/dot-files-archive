# Dot files archive
Save all of the dot files, like `.bashrc`.


# Password protected dot files
Some files are password protected. You need to manually decrypt them.

```sh
# Encrypt
gpg -c <dot file>

# Decrypt
gpg --decrypt --output <dot file name> <gpg file>
```
