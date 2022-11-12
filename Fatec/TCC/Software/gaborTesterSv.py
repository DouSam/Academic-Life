import cv2
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider, Button


# read img and set gray color
img = cv2.imread('exam.jpg')
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

from itertools import chain, combinations

def powerset(iterable):
    "powerset([1,2,3]) --> () (1,) (2,) (3,) (1,2) (1,3) (2,3) (1,2,3)"
    s = list(iterable)
    return chain.from_iterable(combinations(s, r) for r in range(len(s)+1))

print(list(powerset([1,2])))

ksize = range(1, 100, 10)
sigma = np.arange(0.1, 2, 0.1)
theta = range(1, 10, 1)
lambd = range(1, 10, 1)
gamma = np.arange(0.1, 1, 0.1)
psi = np.arange(-1, 2, 0.1)

for ksi in ksize:
    for sig in sigma:
        for the in theta:
            for lam in lambd:
                for gam in gamma:
                    for ps in psi:
                        g_kernel = cv2.getGaborKernel(ksize=(ksi, ksi),
                                  sigma=sig,
                                  theta=np.pi / the,
                                  lambd=np.pi /lam,
                                  gamma=gam,
                                  psi=ps,
                                  ktype=cv2.CV_32F)
                            # recalculate img result
                        res = cv2.filter2D(img, cv2.CV_8UC3, g_kernel)
                        cv2.imwrite('./gabor/{}_{}_{}_{}_{}_{}.png'.format(ksi,sig,the,lam,gam,ps) , res)