use warnings "all";
use warnings::register;

# returns a password suitable for use in the shadow file
# exits with code 2 on error

# Arguments:
#   -s <salt> -p <password>


# REF: 
#  unix.stackexchange.com/questions/158400/etc-shadow-how-to-generate-6-s-encrypted-password
#  unix.stackexchange.com/questions/52108/how-to-create-sha512-password-hashes-on-command-line

# NOTES: 
#  The default for these routines must be SHA512 because I never explicity request it :)
#
#  The password gen methods in this script are common currency.
#  In their bit of advice on generating passwords
#   docs.ansible.com/ansible/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module
#  Ansible recommended SHA512.
#  They recommended mkpasswd as well. The RHEL 6 version does not have the SHA512 option 
#  or anything like it.
#  
#  Want to provide a default for salt?
#  Consider using time (just like that), it returns the number of seconds elapsed since 1970
#
   
   
# even indices hold flags, odd ones contain values
# if undefined, replace with ''
$ARGV[0] //= '';
$ARGV[1] //= '';
$ARGV[2] //= '';
$ARGV[3] //= '';



# Empty values cause an abort
$password = $salt = '';



if ($ARGV[1] ne '') {
  if ($ARGV[0] eq '-p') {
    $password = $ARGV[1];
  }
  elsif ($ARGV[0] eq '-s') {
    $salt = $ARGV[1];
  }
}

if ($ARGV[3] ne '') {
  if ($ARGV[2] eq '-p') {
    $password = $ARGV[3];
  }
  elsif ($ARGV[2] eq '-s') {
    $salt = $ARGV[3];
  }
}



if (($salt ne '') and ($password ne '')) {
  print crypt($password, "\$6\$$salt\$") . "\n";
  exit 0;
}
else {
  print 'returns a password suitable for use in the shadow file' . "\n";
  print $0 . ' -s <salt> -p <password>' . "\n";
  exit 2;
}


