# ruby_parser_task
A short challenge set as a tech test

## Plan

#### Requirements

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log

b. Returns the following:
list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered
e.g.:
/about/2 8 unique views /index 5 unique views etc...

#### My approach
The below diagram shows my plan for the two classes and their responsibilities that will be required to complete the task.

<img src="./readme_images/Plan.png" alt="Plan" width="100%"/>

There are a lot of different ways to complete the challenge. My approach is to stick to object orientated principles and to try and make the code a clear as possible, easy to change and to follow a TDD approach. One option I considered was to just make one class which reads the file, formats the data and then prints it. However, I think using two classes separates the responsibilities of reading the file and formatting the output information which makes the code easier to understand and easier to add additional features in afterwards.

##### reading the file
Having a look at the different options of reading files in ruby, the most efficient seems to be the foreach method as it doesnt open the whole file into the memory at once. This should mean my solution is more scaleable to larger log files.

##### storing the information into structured data
There are a lot of different ways to do this. As the order of the page visits is not important I will rule out an array of arrays. A hash with the page name as the key and the IP address as the value would not allow duplicates very easily so is not suited to this data. I think the best will be a hash with the page name as the key and an array of IP addresses as the value.