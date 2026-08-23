%Project - Stellar Motion%
clc;clear;

load starData
nObs = size(spectra,1);
lambdaStart = 630.02;
lambdaDelta = 0.14;


lambdaEnd = lambdaStart + (nObs - 1)*lambdaDelta;
lambda = lambdaStart:lambdaDelta:lambdaEnd;
lambda = lambda';


s = spectra(:, 1:7);



plot(lambda, s, ".-");
xlabel("Wavelength");
ylabel("Intensity");
hold on;

[sHa, idx] = min(s);
lambdaHa = lambda(idx);


plot(lambdaHa, sHa, "rs", MarkerSize = 8);


z = (lambdaHa/656.28) - 1;
speed = z*299792.458; %km/s

for  i = 1:length(speed)
    disp("Speed of Star " + i + ": " + speed(i) + " km/s");
end

% Part 2: Stellar Motion Graphs for the Dedicated Stars in "starnames".
for v = 1:7

    s = spectra(:,v);

    if speed(v) <= 0

        plot(lambda, s, "--");

    else speed(v) > 0

        plot(lambda, s, LineWidth = 3);

    end
    hold on;
end
hold off;

legend(starnames)
movaway = starnames(speed > 0) %indicates the stars that are moving further from the Earth
