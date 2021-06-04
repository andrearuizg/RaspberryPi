import multiprocessing
import sys
import os
import numpy as np
import cv2
import tensorflow as tf
from tensorflow.keras import models
from tqdm import tqdm

def predict(filename):
	model = models.load_model("model.h5")
	result1 = np.zeros((360, 640, 3), np.uint8)
	image1 = cv2.imread(filename, cv2.IMREAD_COLOR)
	image2 = cv2.resize(image1, (256, 256))
	image = image2 / 255.0
	image = np.reshape(image, [256, 256, 3])
	result = model.predict(np.expand_dims(image, axis=0))[0] > 0.5
	result = result * 255.0
	result = cv2.resize(result, (640, 360), interpolation=cv2.INTER_AREA)
	result1 = cv2.cvtColor(result.astype('uint8'), cv2.COLOR_GRAY2BGR)
	result1[..., 0] = np.where(result1[..., 0], 90, 0).astype('uint8')
	result1[..., 1] = 0
	result1 = cv2.addWeighted(image1, 0.7, result1, 0.3, 0)
	str_file = (filename.split('/')[-1]).split('.')[0]
	filename = "Documentos/%s-predicted.png" % (str_file)
	cv2.imwrite(filename, result1)


if __name__ == '__main__':
	filename = str(sys.argv)
	with multiprocessing.Pool(multiprocessing.cpu_count()) as p:
		predict(filename)
