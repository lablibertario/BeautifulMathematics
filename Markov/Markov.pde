import java.util.Iterator;
import java.util.Random;

BufferedReader reader;
String line;
PFont mono;
 HashMap<String, HashMap<String, Integer>> markov = new HashMap();
void setup() {
  size(780, 760);
  background(90);
  mono = loadFont("GillSansMT-48.vlw");
  // Open the file from the createWriter() example
  reader = createReader("hg.txt"); 
  line = "";
  String finalOutput= "";
  ArrayList<String> pieces = new ArrayList();
  while (line != null) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      // noLoop();
    } else {
      String[] words = split(line, " ");
      for (String word : words) {
        pieces.add(word);
      }
    }
  }

 
  ArrayList<String> workingArr = new ArrayList(pieces);
  ArrayList<String> usedWords = new ArrayList();
  for (String word : pieces) {
    if (!usedWords.contains(word)) {
      usedWords.add(word);
      HashMap<String, Integer> wordProbability = new HashMap();
      while (workingArr.contains(word)) {
        if (workingArr.indexOf(word)+1 < workingArr.size()) {
          String secondWord = workingArr.get(workingArr.indexOf(word)+1);
          if (wordProbability.get(secondWord) != null) {
            wordProbability.put(secondWord, wordProbability.get(secondWord)+1);
          } else {
            wordProbability.put(secondWord, 1);
          }
        }
        workingArr.remove(workingArr.get(workingArr.indexOf(word)));
      }
      workingArr = new ArrayList(pieces);
      markov.put(word, wordProbability);
    }
  }
  String myWord = "Die";
  finalOutput += myWord;
  println("Words rdy in array");
  print(myWord+" ");
  for (int i = 0; i< 500; i++) {
    HashMap<String, Integer> arr = new HashMap<String, Integer>(markov.get(myWord));
    Iterator it = arr.entrySet().iterator();
    int counter = 0;
    while (it.hasNext()) {
      HashMap.Entry<String, Integer> pair = (HashMap.Entry)it.next();
      counter+= pair.getValue();
      //  it.remove(); // avoids a ConcurrentModificationException
    }

    int onePercent = (int)Math.ceil((float)100 / counter);
    it = arr.entrySet().iterator();
    int oldVal = 0;
    Random rn = new Random();
    int random = onePercent*(rn.nextInt(counter - 1 + 1) + 1);
    boolean finished = false;
    while (it.hasNext() && !finished) {
      HashMap.Entry<String, Integer> pair = (HashMap.Entry)it.next();
      // markov.get(pair.getKey()).put(pair.getKey(),pair.getValue()*onePercent+oldVal);
      if (random <= pair.getValue()*onePercent+oldVal) {
        myWord = pair.getKey();
        finished = true;
      }
      //println(random);
      oldVal = pair.getValue()*onePercent+oldVal;
      it.remove(); // avoids a ConcurrentModificationException
    }
    print(myWord+" ");
    finalOutput+=" "+ myWord;
  }
  
  fill(230);
  //textFont(mono);
  textSize(30); 
  text(finalOutput, 100, 100, 500,2000); 
}

void mousePressed() {
  clear();
  background(90);
  String finalOutput = "";
  String myWord = "Die";
  finalOutput += myWord;
  println("Words rdy in array");
  print(myWord+" ");
  for (int i = 0; i< 30; i++) {
    HashMap<String, Integer> arr = new HashMap<String, Integer>(markov.get(myWord));
    Iterator it = arr.entrySet().iterator();
    int counter = 0;
    while (it.hasNext()) {
      HashMap.Entry<String, Integer> pair = (HashMap.Entry)it.next();
      counter+= pair.getValue();
      //  it.remove(); // avoids a ConcurrentModificationException
    }

    int onePercent = (int)Math.ceil((float)100 / counter);
    it = arr.entrySet().iterator();
    int oldVal = 0;
    Random rn = new Random();
    int random = onePercent*(rn.nextInt(counter - 1 + 1) + 1);
    boolean finished = false;
    while (it.hasNext() && !finished) {
      HashMap.Entry<String, Integer> pair = (HashMap.Entry)it.next();
      // markov.get(pair.getKey()).put(pair.getKey(),pair.getValue()*onePercent+oldVal);
      if (random <= pair.getValue()*onePercent+oldVal) {
        myWord = pair.getKey();
        finished = true;
      }
      //println(random);
      oldVal = pair.getValue()*onePercent+oldVal;
      it.remove(); // avoids a ConcurrentModificationException
    }
    print(myWord+" ");
    finalOutput+=" "+ myWord;
  }
  
  fill(230);
  textFont(mono);
  textSize(30); 
  text(finalOutput, 100, 100, 500,2000); 
}

void draw() {
} 