# shortcut_test_project

A new Flutter project.

## Getting Started

Hi, my name is Yevhenii, I am pleased to meet you! 
I wrote this test application because I want to work together with you. I tried to write a good application, but unfortunately I didn't have much time to make it better, because lately a lot of work on the current job. Also I didn't add unit & integration tests, I could think of some excuse here, but I will be honest. I don't have much experience writing tests. But in case it's necessary, it won't cause me any difficulty, I'm quite capable of learning them to a good level of knowledge. Thank you for paying attention to this text, I wish you a good day and don't judge =)



## Here I described the basic functionality that I implemented

In the app itself I've implemented a display of the latest comics that came out, you can view them in the 'Last comics' category. I display the last 4 comics there, but also as you scroll through the carousel 4 more comics will be loaded all the time. 

I've also implemented a search by comic number, you can see this in the 'Search by number' category. There is nothing complicated here, just enter number of comic and boom you get it (if it exists of course).

Clicking on the comic itself will open its preview for you there you will see the same picture but in enlarged size, its title, date of issue, alt as well as a transcript.

I also added a button to the preview which allows you to share the comic, send a link to the image as well as a transcript.

There is error handling in the app and in case of an error it will let you know.



## Here I've described the main libraries I use

I chose Cubit (BloC)  library as a helps to separate presentation from business logic, because I think it is simple enough and good library for small applications.

I also used json_mapper library to work with json. This library helps to save a lot of time because it generates a file that helps to work with json.



## This is where I described the points I wanted to let you know about

I also have a folder called helpers where I put the main constants and decorations I used in the app and also have a folder called widgets where I put the main widgets that I used in different parts of the app

When you see the comics_api file, you will notice the strange function getComics. I made it to get an array of comics (I can't find an array of comics in the tutorial, so I made this function), it gets 4 elements. With the ability to load subsequent comics. 

