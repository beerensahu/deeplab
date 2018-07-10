import os

path = "PQR/dataset/JPEGtImage/"

with open("train.txt","w+") as t:
	for files in os.listdir(path):
		fname_list = files.split('.')[0:-1]
		fname = ''.join(fname_list)
		t.write(fname)
		t.write("\n")