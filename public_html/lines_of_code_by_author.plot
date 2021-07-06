set terminal png transparent size 640,240
set size 1.0,1.0

set terminal png transparent size 640,480
set output 'lines_of_code_by_author.png'
set key left top
set yrange [0:]
set xdata time
set timefmt "%s"
set format x "%Y-%m-%d"
set grid y
set ylabel "Lines"
set xtics rotate
set bmargin 6
plot 'lines_of_code_by_author.dat' using 1:2 title "Sage Weil" w lines, 'lines_of_code_by_author.dat' using 1:3 title "Kefu Chai" w lines, 'lines_of_code_by_author.dat' using 1:4 title "Yehuda Sadeh" w lines, 'lines_of_code_by_author.dat' using 1:5 title "Jason Dillaman" w lines, 'lines_of_code_by_author.dat' using 1:6 title "Greg Farnum" w lines, 'lines_of_code_by_author.dat' using 1:7 title "Samuel Just" w lines, 'lines_of_code_by_author.dat' using 1:8 title "Patrick Donnelly" w lines, 'lines_of_code_by_author.dat' using 1:9 title "Loic Dachary" w lines, 'lines_of_code_by_author.dat' using 1:10 title "John Spray" w lines, 'lines_of_code_by_author.dat' using 1:11 title "Josh Durgin" w lines, 'lines_of_code_by_author.dat' using 1:12 title "Casey Bodley" w lines, 'lines_of_code_by_author.dat' using 1:13 title "Yan, Zheng" w lines, 'lines_of_code_by_author.dat' using 1:14 title "Danny Al-Gaaf" w lines, 'lines_of_code_by_author.dat' using 1:15 title "Xie Xingguo" w lines, 'lines_of_code_by_author.dat' using 1:16 title "Radoslaw Zarzynski" w lines, 'lines_of_code_by_author.dat' using 1:17 title "Mykola Golub" w lines, 'lines_of_code_by_author.dat' using 1:18 title "David Zafman" w lines, 'lines_of_code_by_author.dat' using 1:19 title "Colin P. McCabe" w lines, 'lines_of_code_by_author.dat' using 1:20 title "Sebastian Wagner" w lines, 'lines_of_code_by_author.dat' using 1:21 title "Alfredo Deza" w lines
