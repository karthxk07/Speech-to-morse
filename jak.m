
recObj = audiorecorder;
disp("Begin recording");
record(recObj);
x = input("Enter -1  to stop recording: ");
if(x==-1)
    stop(recObj);
else
    disp("Input Error");
end    
disp("End of recording");

y= getaudiodata(recObj);
plot(y)

soundsc(y,8000)

transcriber = speechClient("wav2vec2.0");
transcript = speech2text(transcriber,y,8000);
textData = transcript{:,"Transcript"};

alphabetSet = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'};
morseCodeSet = {'.-','-...','-.-.','-..','. ..-.','..-.','--.','....','..',' .---','-.-','.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..','-----','.----','..---','...--','....-','.....','-....','--...','---..','----.'};
morseAlphabet = containers.Map(alphabetSet,morseCodeSet);

morseCode = "";


for i=1:textData.length()
    for j=1:strlength(textData(i))
        currentChar = textData{i}(j);
        currentChar = upper(currentChar);
        if isKey(morseAlphabet,currentChar)
            morseCode = morseCode+morseAlphabet(currentChar);
            morseCode = morseCode+" ";
        end
        

    end
    morseCode = morseCode + "_"
end

signal = zeros(1, strlength(morseCode) * 3 );

count = 2;
for i=1:strlength(morseCode)
    switch(morseCode{1}(i))
        case(".")
        signal(count:count+1) =1;

        count = count + 1;
        case("-")
        signal(count:count+3) =1;
       
        count = count+3;
        case(" ")
        signal(count:count+3) = 0;
        
        count = count+3;
        case("_")
        signal(count:count+7) = 0;

        count = count+7;
    end
    signal(count:count) = 0;
    count = count+1;
end
figure
x = 1:length(signal);
plot(x,signal);
xlabel("Time");
ylabel("Signal");









