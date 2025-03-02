%Move_wav.mat 
%Move AMAR .wav files
tic;
clear
close all

%%%%% Make changes as needed %%%%%
%enter path to highest data folder
Path2Data = 'G:\CBN_2022_10\Data';
Path2Output = 'F:\CBN_2022_10\';
OUTPUT_FOLDER = 'AMAR819.1234.32000';
%if you want to skip the moving of Non-Acoustic files set to 0
move_NonAcoustic = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

files = dir(fullfile(Path2Data, '**\*.wav')); %Recursively find all WAV files (add sorting...)

for f = 1:length(files)
    file = [files(f).folder,'\',files(f).name];
movefile(file,[Path2Output,OUTPUT_FOLDER])

end

if move_NonAcoustic == 1
    ext = {'**/*.csv','**/*.xml', '**/*.txt'};
    extensions = cellfun(@(x)dir(fullfile(Path2Data,x)),ext,'UniformOutput',false);
    other_files = vertcat(extensions{:});

    if ~exist([Path2Output,'\Non-Acoustic Files'], 'dir')
       mkdir([Path2Output,'\Non-Acoustic Files'])
    end
    
    for f = 1:length(other_files)
        file = [other_files(f).folder,'\',other_files(f).name];
        movefile(file,[Path2Output,'\Non-Acoustic Files'])
    end
end
toc;

 
