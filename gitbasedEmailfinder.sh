
echo "Enter git url:  github.com/x/x.git"
read gitx

echo ""

echo "Which company email do you want?"
read cname

echo ""

git clone https://$gitx

repo=$(echo $gitx | sed -e 's/\.[^.\]*$//' | sed 's#.*/##' )

echo ""

cd $repo/ 

#git log to leak.txt
git log -p > leak.txt

#fetching emails
cat leak.txt | grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" | sort -u >> emails-from-github.txt
echo "*****************************" >> emails-from-github.txt

echo "--------------------------------------------------------------------"
if cat emails-from-github.txt | grep $cname
then

echo ""
echo "Email found!"

else
	


echo "No email found"

fi


#end of code

