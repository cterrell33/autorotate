currentpw=$(aws secretsmanager get-secret-value --secret-id test1 --query SecretString --output text)

echo -e "$currentpw""\n""superman23!""\n""superman23!""\n""superman23!"|smbpasswd -U test1 -r 172.31.2.156