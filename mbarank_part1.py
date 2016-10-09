import matplotlib
from pylab import *
from matplotlib import pyplot as PLT
from operator import itemgetter, attrgetter

"""
mbarank_part1: This program reads in a csv file. It plots the data from 1 column in a horizontal bar chart. 
It also draws a vertical line to hightlight the average. In most cases functions are set with
default values. Uncomment items 1-5 to see how to customize your chart. 

"""

# read in and store csv file in a recarray object.
# allows for easy access of columns and rows
data = csv2rec('./data/mba.csv', skiprows=0, delimiter=',')

# getting sorted data for the 4th column presalary
presalsort = sorted(data, key=itemgetter(4))

presalary = list(map(itemgetter(4), presalsort))
print (presalary)

# getting corresponding school names for sorted column 4 data
getnames = itemgetter(1)
presalnames = list(map(getnames, presalsort))

# Create a figure canvas for plotting one or more graphs
# fig = PLT.figure()

"""
01--> Replace fig
Set the figure size
"""
fig = PLT.figure(linewidth=0.0, frameon=True, dpi=80, figsize=(17, 8))

"""
02--> Add to customize the window title, font size, font color, background of canvas
"""
fig.canvas.set_window_title('MBA Rankings')
fig.patch.set_facecolor('#FFFFFF')
matplotlib.rc('xtick', labelsize=9, color='#000000')  # setting font size for x & y labels and color to black
matplotlib.rc('ytick', labelsize=9, color='#000000')

# Create space/position to put your horizontal barchart(barh) for %presalary
# ax1 = fig.add_subplot(111)

"""
03--> Replace ax1. 
Add figure to a grid of 1 row, 3 columns, item 1. Also, remove the frame
and set the background of the individual chart ax1 to white.
"""
ax1 = fig.add_subplot(131, frameon=False, axis_bgcolor='#FFFFFF')

"""
04 --> remove all those annoying ticks marks on subplot x & y for every data point
"""
for a in ax1.yaxis.majorTicks:
    a.tick1On = False
    a.tick2On = False

for a in ax1.xaxis.majorTicks:
    a.tick1On = False
    a.tick2On = False

# Bar lengths and position the bar on the center of the Y axis
val = presalary
pos = arange(len(presalary)) + .5  # len is the number of rows in the column presalary

# Draw the chart in subplot
# rects = ax1.barh(pos, val)

"""
05 --> Replace rects.
Draw the chart with additional parameters such as 
color of bar and height of bar and bar edge. 
Notice the bar color and edge color are the same. A light gray. 
"""
ax1.barh(pos,val, align='center', edgecolor='#CCCCCC', height=.25, color='#CCCCCC')

yticks(pos, (presalnames))
xlabel('Pre Salary %')

# Plot a solid vertical gridline to highlight the avg position. Note the average is hardcoded. This is just an example of plotting using vertical lines
plt.plot([75.96, 75.96], [0, 26], 'r', alpha=0.25, lw=2)

"""
Plot three more charts for average salary and total tuition cost
"""
# getting sorted data for the 4th, 5th and 10th column
avgsalsort = sorted(data, key=itemgetter(3))
totaltuitsort = sorted(data, key=itemgetter(9))
# print(totaltuitsort[4])


avgsalary = list(map(itemgetter(3), avgsalsort))
avgsalary = list(map(lambda x: x/1000, avgsalary))
totaltuition = list(map(itemgetter(9), totaltuitsort))
totaltuition = list(map(lambda x: x/1000, totaltuition))
print (avgsalary)
print (totaltuition)

# getting corresponding school names for sorted column 4 data
avgsalnames = list(map(itemgetter(1), avgsalsort))
totaltuitnames = list(map(itemgetter(1), totaltuitsort))

"""
Setup figure 2 average salary
"""
ax2 = fig.add_subplot(132, frameon=False, axis_bgcolor='#FFFFFF')

for a in ax2.yaxis.majorTicks:
    a.tick1On = False
    a.tick2On = False

for a in ax2.xaxis.majorTicks:
    a.tick1On = False
    a.tick2On = False

ax2.barh(pos,avgsalary, align='center', edgecolor='#CCCCCC', height=.25, color='#CCCCCC')
yticks(pos, (avgsalnames))
xlabel('Average Starting Salary in USD(000s)')

plt.plot([113.73, 113.73], [0, 26], 'r', alpha=0.25, lw=2)

"""
Setup figure 3 total tuitions
"""
ax3 = fig.add_subplot(133, frameon=False, axis_bgcolor='#FFFFFF')


for a in ax3.yaxis.majorTicks:
    a.tick1On = False
    a.tick2On = False

for a in ax3.xaxis.majorTicks:
    a.tick1On = False
    a.tick2On = False

ax3.barh(pos,totaltuition, align='center', edgecolor='#CCCCCC', height=.25, color='#CCCCCC')
yticks(pos, (totaltuitnames))
xlabel('Total Tuition in USD(000s)')

plt.plot([94.96, 94.96], [0, 26], 'r', alpha=0.25, lw=2)

PLT.tight_layout(pad=0.4, w_pad=0.5, h_pad=1.0)
# display the chart
PLT.show()
