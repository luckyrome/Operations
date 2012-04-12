#----------------------------------------------------------------
# Finds a line in an encrypted text file and outputs to stdout
#
# Notes
# =====
# - My main usage: for password retrieval :)
#
# - I originally had the file name hard coded, but upon refactoring 
#   this, I decided that I could segment my password files into 
#   levels of importance and even different sets of machines/sites 
#   (like amazon instances or something)
# 
# - The file name is hard coded as .<name>.gpg because
#   1) Starting the file name with . hides it from people who just use ls
#   2) it's a gpg file anyway (I don't think I'm able to gpg a non .gpg file)
#
# - The files I use are usually in this format (because I find it useful):
#   Entity Name:UserName:Password (or just password beginning if I'm paranoid)
#
# - This allows me to go `pfind file :` which will return the whole file
#       - I actually had a pcat() which would do the same thing, but this is 
#         less code
# 
# - For those who don't want to look up the man page:
#   --no-verbose && --quiet : output nothing aside from decrypted data
#   --no-mdc-warning : seriously, no output. This suppresses a 
#       warning brought on by not using mdc when encrypting the data
#   --decrypt <blah> decrypt this file and output it to stdout (so I can
#       pipe that into grep :D - Thanks Ross@VeloReviews for pointing that out)
# 
# @param $1 the <name> of a .<name>.gpg file
# @param $2 some text in the line you're looking for
#---------------------------------------------------------------
function pfind(){
    gpg --no-verbose --quiet --no-mdc-warning --decrypt ~/.$1.gpg | grep $2
}
