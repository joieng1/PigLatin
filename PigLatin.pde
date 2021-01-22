int x = 0;
public void setup() 
{
  String[] lines = loadStrings("words.txt");
  String[] test = loadStrings("ans.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
    //runs test to identify which ones are true and which are false
    if (pigLatin(lines[i]).equals(test[i])) {
      System.out.println(i + " is true");
    } else {
      System.out.println(i + " is false");
    }
  }
}

public int findFirstVowel(String sWord) {
  //precondition: sWord is a valid String of length greater than 0.
  //postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
  for (int i = 0; i<sWord.length(); i++) {
    if (sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' ||sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u') {
      return i;
    }
  }
  return -1;
}




public String pigLatin(String sWord)
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
{
  if (findFirstVowel(sWord) == -1) //if no vowel in the word
  {
    return sWord + "ay";
  } else //if there is a vowel
  {
    if (sWord.charAt(0) != 'q' && sWord.charAt(0) != 'a' && sWord.charAt(0) != 'e' && sWord.charAt(0) != 'i' && 
      sWord.charAt(0) != 'o' && sWord.charAt(0) != 'u') { //if there isn't any vowels in the first letter
      for (int i = 0; i< sWord.length(); i++) { //check for which index is the firt vowel, sets x to that index number
        if (sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o'|| sWord.charAt(i) == 'u') {
          x = i;
          break;
        }
      }
      return sWord.substring(x, sWord.length()) + sWord.substring(0, x) + "ay";
    }
    if (sWord.charAt(0) == 'q' && sWord.charAt(1) == 'u') {
      return sWord.substring(2) + sWord.substring(0, 2) + "ay";
    }
    return sWord + "way";
  }
}
