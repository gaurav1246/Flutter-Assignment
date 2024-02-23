# Flutter Assignment

**About the Flutter Assignemnt Project:**
This project has been created to write programs that solve various problem statements, allowing individuals to demonstrate their knowledge and skills in the domain. The app includes a separate page for each problem, showcasing the best-known solution.

**Tool & Technology:**
1. Flutter SDK
2. Firebase Storage
3. GetX for observable architecture
4. MVC Pattern.
5. Clean Coading.

**Getting Started**
Here are some steps that will be useful to begin this project:
1. download the repositiry from github.
2. unzip the downloaded repo.
3. open the project in your fevorite IDE-Android Studio or Visual Studio.
4. Run the 'pub get' command on the terminal to prepare to run the project.
5. Run the 'flutter run' command on the terminal to run the code on specific platform you choose. 

**Home Screen:**

This is the home screen of the app, you can click on individual buttons to see the task

![11](https://github.com/gaurav1246/Flutter-Assignment/assets/16500290/e57cc715-c689-4fd1-a7db-8448622f0a16)



**Task 1: File Upload to Firebase Storage**

Problem Statement:
Create a file upload feature in Flutter that accepts any image or video files, less than 10 MB and upload the file to the firebase storage.
Add some some interactions or animations like upload progress and file upload status Add a preview of the file that has been uploaded.
Place appropriate validations and error messages wherever required.

Solution:
I designed a screen that features a single button for uploading files. When you tap on the button, it will take you to the file selection page. Once you choose a file, it will check its size and upload it to Firebase storage. You will see a loader on the screen while the upload is in progress.
After a video or image is successfully uploaded, it is downloaded automatically from Firebase storage. Videos can also be played directly. Please note that only image or video files under 10 MB are accepted. Rest assured, validations and error messages will be displayed to guide you through the process.

Screenshots:

![MicrosoftTeams-image (21) (2)](https://github.com/gaurav1246/Flutter-Assignment/assets/16500290/fe83e660-4592-41cb-b5f7-525cc5613608)
![MicrosoftTeams-image (20) (1)](https://github.com/gaurav1246/Flutter-Assignment/assets/16500290/df5e20fd-86b3-4ac0-977c-a70eff14d76e)


**Task 2: Fibonacci Series Application**
Problem Statement:
Write a simple application using a recursive function that accepts a value (integer) and returns the fibonacci value at that position in the series.
The application should be performant at scale to handle larger numbers without slowing down exponentially.

Solution:
I designed a screen featuring an input box for integer numbers of varying lengths along with a button to display the outcome. Once pressed, the button triggers a recursive function to determine the Fibonacci value at a specified position. Rest assured, the efficiency of the calculation and operation will not impede user interaction. If the factorial value exceeds a certain limit, an infinity sign will be shown instead.

Screenshots:

![6](https://github.com/gaurav1246/Flutter-Assignment/assets/16500290/ee4a3aef-d277-41bb-9b11-90676b243c9a)
![2](https://github.com/gaurav1246/Flutter-Assignment/assets/16500290/da534bd5-fea7-407a-898f-d331d1834430)




**Task 3: Balanced Substrings**
Problem Statement:
A string is balanced if it consists of exactly two different characters and both of those characters appear exactly the same number of times. For example: "aabbab" is balanced (both 'a' and 'b' occur three times) but "aabba" is not balanced ('a' occurs three times, 'b' occurs two times). String "aabbcc" is also not balanced (it contains three different letters). A substring of string S is a string that consists of consecutive letters in S. For example: "ompu" is a substring of "computer" but "cmptr" is not. Write a function solution called getBalancedSubstrings (List<String> S) that, given a string S, returns an
array of the longest balanced substring of S.Examples: 1. Given S = "cabbacc", the function should return ["abba"] because it is the longest balanced substring.
2. Given S = "abababa", the function should return ["ababab", "bababa"] which are the longest balanced substrings.
3. Given S = "aaaaaaa", the function should return [] since S does not contain a balanced substring. Write an efficient algorithm for the following assumptions: - N is an integer within the range [1..100,000]; - string S is made only of lowercase letters (a-z).

Solution:
I have designed a screen with an input box that can accept a string of any length. There is also a button that will display the result. When you click the button, it will call the function to determine if the input string is balanced or not. Additionally, it will calculate the number of balanced substrings that can be formed. I have also implemented functional validation to ensure everything works smoothly.

Screenshots:

![3](https://github.com/gaurav1246/Flutter-Assignment/assets/16500290/8684b621-70cb-4aa3-93a8-11dc2501d5ba)
![5](https://github.com/gaurav1246/Flutter-Assignment/assets/16500290/2b3bda0a-9a68-402b-86c1-b875cffacfa3)

