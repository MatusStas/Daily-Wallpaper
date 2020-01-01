import os

def main() :
	url = open("api","r").read().split('regular":"')[1].split('","')[0]
	os.system(f'wget -q {url}')

main()

