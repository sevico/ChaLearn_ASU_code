import lmdb
import feat_helper_pb2
import numpy as np
import scipy.io as sio
import time

def main(argv):
    lmdb_name = sys.argv[1]
    print "%s" % sys.argv[1]
    batch_num = int(sys.argv[2]);
    batch_size = int(sys.argv[3]);
    window_num = batch_num*batch_size;

    start = time.time()
    if 'db' not in locals().keys():
        db = lmdb.open(lmdb_name)
        txn= db.begin()
        cursor = txn.cursor()
        cursor.iternext()
        datum = feat_helper_pb2.Datum()
        keys = []
        values = []
	#print( cursor.iternext_dup())
        for key, value in enumerate( cursor.iternext_dup()):
     	    #print('-----------ooooooooooooooooooooo')
            keys.append(key)
            values.append(cursor.value())
	print(len(values))
    ft = np.zeros((window_num, int(sys.argv[4])))
    for im_idx in range(window_num):
	
	print('-------------------------',len(keys),im_idx)
        datum.ParseFromString(values[im_idx])
        ft[im_idx, :] = datum.float_data

    print 'time 1: %f' %(time.time() - start)
    sio.savemat(sys.argv[5], {'feats':ft})
    print 'time 2: %f' %(time.time() - start)
    print 'done!'

if __name__ == '__main__':
    import sys
    main(sys.argv)
