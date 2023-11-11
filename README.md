# 🔊 Speech to Morse Code Encoder 🔠

## 🌐 Abstract
This project aimed to create an encoder that transforms user-provided audio into Morse code. It's a big deal for securing data during communication. The encoder first changes audio input into a waveform, then uses advanced speech-to-text models to convert spoken language into written text. This written text is then turned into Morse code using a pre-made data array. The Morse code is transformed into a signal, offering diverse applications for data communication and security. 🚀

**Keywords**: encoder, audio input, Morse code, speech, encryption, data communication

---

## 📝 Contents
- **Abstract** 
- **1. Introduction** 
  - 1.1 Technological Foundations
  - 1.2 Applications
- **2. Implementation** 
  - 2.1 Audio Data Collection	
  - 2.2 Input Audio Waveform
  - 2.3 Transcription
  - 2.4 Text to Morse
  - 2.5 Output Waveform
- **3. Results and Waveforms** 
- **4. Conclusion** 
- **References**

---

## 🚀 Introduction
In the digital world, secure data communication is crucial. This project introduces an audio-to-Morse code encoder created within MATLAB, aiding encryption and amateur radio communication. 📡🔒

![Morse Code](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/International_Morse_Code.svg/260px-International_Morse_Code.svg.png)

### 1.1 Technological Foundations
This encoder uses speech-to-text models in MATLAB to process audio into text using deep learning. It then translates this text into Morse code.

### 1.2 Applications
- **Encryption of Data in Communication**: Encrypts audio into Morse code for secure communication.
- **Amateur Radio (Ham Radio) Communication**: Aids radio operators in decoding Morse code for reliable communication.

---


## 🛠️ Implementation

### 2.1 Audio Data Collection
The process of audio data acquisition in MATLAB is facilitated by the Audio Toolbox addon. This toolbox provides a means to capture audio data directly from the user through the system's default microphone input. The pivotal component in this process is the 'audiorecorder' function, which enables the creation of a dedicated recorder object. This object, in turn, offers the capability to initiate audio recording using the 'record(recObj)' function and, conversely, halt the recording process using the 'stop(recObj)' function.
```
recObj = audiorecorder;
disp("Begin recording");
record(recObj);
x = input("Enter -1 to stop recording: ");
if (x == -1)
    stop(recObj);
else
    disp("Input Error");
end
disp("End of recording");
```
In this code snippet, the user initiates the audio recording process using MATLAB. An audio recorder object, recObj, is created, and the recording begins with a "Begin recording" message displayed in the console. The record function captures audio data from the system's default microphone input, and the code prompts the user to input -1 to halt the recording. Upon entering -1, the recording is stopped using the stop function applied to recObj. If any other input is given, an "Input Error" message is displayed. Finally, the code indicates the end of the recording process with the message "End of recording."

### 2.2 Input Audio Waveform
To display the audio waveform, the audio data from the recObj is read using the getaudiodata(recObj) function and plotted using the plot(y) function. Optionally, the audio can be played back to the user using the soundsc(y, fs) function, where fs is the sampling rate of the collected audio data (default 8000).
```
y = getaudiodata(recObj);
plot(y)
soundsc(y, 8000)
```
The getaudiodata function reads the audio data from the recObj, and the plot function visualizes the audio waveform. Additionally, the soundsc function can play back the audio to the user at a specified sampling rate.

### 2.3 Transcription
Following the audio waveform visualization, a MATLAB speech-to-text model is employed to transcribe the audio data represented by the variable y at a sampling rate of 8000 samples per second. The resulting transcription is stored in the transcript variable.
```
transcriber = speechClient("wav2vec2.0"); % or Google, Microsoft, IBM
transcript = speech2text(transcriber, y, 8000);
for word = transcript(:,"Transcript")
    disp(word);
end
```
Here, the speechClient function initializes a speech-to-text model, and the speech2text function transcribes the audio data (y) using the specified model and sampling rate. The for loop then displays each transcribed word in the console.

### 2.4 Text to Morse
The code uses a loop to iterate through each word in the text and converts it to Morse code using a mapping function, which is defined within the code. This Morse code for each word is then appended to the existing `morseCode` variable.
```
% Definition of alphabet and Morse code mapping
alphabetSet = {'A','B','C',...}; % All letters and numbers
morseCodeSet = {'.-','-...',...}; % Corresponding Morse code
morseAlphabet = containers.Map(alphabetSet, morseCodeSet);
morseCode = "";

for i = 1:textData.length()
    for j = 1:strlength(textData(i))
        currentChar = upper(textData{i}(j));
        if isKey(morseAlphabet, currentChar)
            morseCode = morseCode + morseAlphabet(currentChar) + " ";
        end
    end
    morseCode = morseCode + "_";
end
```
The provided MATLAB code demonstrates the generation of Morse code from text data. The alphabetSet and morseCodeSet arrays map each letter and number to its corresponding Morse code. A containers.Map named morseAlphabet is created using these arrays to efficiently store and retrieve the Morse code for each character.
The nested loops traverse through the text data, checking each character and finding its Morse code representation using the mapping stored in morseAlphabet. If a character is found in the map, its Morse code is appended to the morseCode variable. An underscore _ is used as a delimiter between words.

### 2.5 Output Waveform
The final step involves plotting the generated Morse code on a graph as a rectangular wave and playing it back as audio.
```
signal = zeros(1, strlength(morseCode) * 3);
colors = zeros(strlength(morseCode) * 3, 3);
count = 2;

for i = 1:strlength(morseCode)
    % Code to generate the signal based on Morse code
    % ...
end

plot(signal);
```
This portion of the code generates a rectangular signal based on the Morse code representation. It prepares a signal and color vectors and uses a loop to iteratively construct the signal based on the Morse code's dot, dash, and gap durations. The resulting graphical plot provides a visual representation of the Morse code transmission.

---

## 📊 Results & Waveforms
- ![image](https://github.com/karthxk07/Speech-to-morse/assets/109301536/d6b268d2-d71b-44e3-b72f-43225139ac61)

- ![image](https://github.com/karthxk07/Speech-to-morse/assets/109301536/8cdf8d9f-97b5-4a15-9d94-dc9c9971b0fb)


---

## 🎯 Conclusion
We've successfully designed an audio-to-Morse code encoder using MATLAB. This project showcases the transformation from spoken language to Morse code and represents an innovative solution with diverse applications. 🌐

---

## 🔗 References
- [Mathworks - AudioToolbox documentation](link)
- [Wikipedia - Morse code](link)
