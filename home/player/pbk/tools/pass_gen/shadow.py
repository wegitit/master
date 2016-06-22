import crypt, getopt, sys

# returns a password suitable for use in the shadow file
# exits with code 2 on error

# Arguments:
#   -h -s <salt> -p <password>


# REF: unix.stackexchange.com/questions/158400/etc-shadow-how-to-generate-6-s-encrypted-password
#      unix.stackexchange.com/questions/52108/how-to-create-sha512-password-hashes-on-command-line

# NOTES:
#   The default for these routines must be SHA512 because I never explicity request it :)
#
#  The password gen methods in this script are common currency.
#  In their bit of advice on generating passwords
#   docs.ansible.com/ansible/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module
#  Ansible recommended SHA512.
#  They recommended mkpasswd as well. The RHEL 6 version does not have the SHA512 option 
#  or anything like it.
#  
#  Their python script relys on installing passlib with pip.
#  python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.encrypt(getpass.getpass())"
#  

def helpexit(arg):
   print 'returns a password suitable for use in the shadow file'
   print sys.argv[0] + ' -h -s <salt> -p <password>'
   sys.exit(arg)
   
   
def main(argv):
   salt = ''
   password = ''
   
   try:
      opts, args = getopt.getopt(argv, 'h:s:p:', ['salt=', 'password='])
      if len(sys.argv) == 1:
        raise ValueError
   
   except getopt.GetoptError:
      helpexit(2)
   except ValueError:
      helpexit(2)
      
   for opt, arg in opts:
      if opt == '-h':
         helpexit(0)
      elif opt in ('-s', '--salt'):
         salt = arg
      elif opt in ('-p', '--password'):
         password = arg

         
   if (salt == '') or (password == ''):
     helpexit(2)
   

   print crypt.crypt(password, '$6$' + salt + '$')


   
if __name__ == "__main__":
   main(sys.argv[1:])


