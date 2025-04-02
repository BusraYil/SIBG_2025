function avansfftplot(data,fs,norm,style,log)
%AVANSFFTPLOT   Simplified fft plot function (ver 3.4)
%   AVANSFFTPLOT(data) shows the frequency spectrum for vector data.
%
%   AVANSFFTPLOT(data,fs) uses sampling frequency fs. If fs equals zero,
%   a normalized frequency axis is used (0 - pi rad/sample).
%
%   AVANSFFTPLOT(data,fs,norm) shows the spectrum using a normalized
%   amplitude axis (0 - 1) when norm is 1 or 2. When norm is 2, the 
%   DC-component of the signal is not shown.
%
%   AVANSFFTPLOT(data,fs,norm,style) uses the indicated style, 
%   e.g. 'filled' of 'red'.
%
%   AVANSFFTPLOT(data,fs,norm,style,log) uses a logarithmic y-axis 
%   when log is 1 and a dB-scale when log is 2.

norm_freq=0;
norm_ampl=0;
use_log=0;
use_style=' ';
use_log=0;

if nargin==1 || fs==0
    fs=length(data);
    norm_freq=1;
end

if nargin>=3 && norm
    norm_ampl=1;
    if norm==2
        norm_ampl=2;
    end
end

if nargin>=4
    use_style=style;
end

if nargin==5 && log~=0
    use_log=log;
end

X=fft(data)/length(data);
freq=(0:length(data)/2-1)*fs/length(data);

if norm_ampl==2
    X(1)=0;
end

if max(abs(X))
    if norm_ampl
        if use_log==1
            semilogy(freq,(abs(X(1:floor(length(X)/2)))/max(abs(X))),use_style);
            axis([0 fs/2 0 3]);
        else 
            if use_log==2
                semilogy(freq,(abs(X(1:floor(length(X)/2)))/max(abs(X))),use_style);
                yticklabels(20*log10(yticks));
                axis([0 fs/2 0 3]);
            else
                plot(freq,(abs(X(1:floor(length(X)/2)))/max(abs(X))),use_style);
                axis([0 fs/2 0 1.1]);
            end
        end
    else
        if use_log==1
            semilogy(freq,abs(X(1:floor(length(X)/2))),use_style);
            axis([0 fs/2 0 3*max(abs(X))]);
        else 
            if use_log==2
                semilogy(freq,abs(X(1:floor(length(X)/2))),use_style);
                yticklabels(20*log10(yticks));
                axis([0 fs/2 0 3*max(abs(X))]);
            else
                plot(freq,abs(X(1:floor(length(X)/2))),use_style);
                axis([0 fs/2 0 1.1*max(abs(X))]);
            end
        end
    end
else
    if use_log==1
        semilogy(freq,zeros(1,length(freq)),use_style);
        axis([0 fs/2 0 3]);
    else 
        if use_log==2
            semilogy(freq,zeros(1,length(freq)),use_style);
            yticklabels(20*log10(yticks));  
            axis([0 fs/2 0 3]);
        else
            plot(freq,zeros(1,length(freq)),use_style);
            axis([0 fs/2 0 1.1]);
        end
    end
end

title('avansfftplot');

if norm_ampl==1
    if use_log==2
        ylabel('Amplitude (normalised [dB])');
    else
        ylabel('Amplitude (normalized)');
    end
else
    if use_log==2
        ylabel('Amplitude [dB]');
    else
        ylabel('Amplitude');
    end    
end

if nargin==1 || norm_freq
    xlabel('Frequency (normalized, \times\pi rad/sample)');
    xlabs=[0:0.1:1];
    xticks(xlabs*fs/2)
    xticklabels(xlabs)
else
    xlabel('Frequency');
end

 