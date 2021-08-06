% function coded = caesar(A, s)
% if abs(s) > 95
%     a = rem(s,95);
%     s = -a;
% end
% num=double(A+s);
% for i = 1:length(num)
%     if num(i) < 32
%        coded(i) = abs(127-(32 - abs(num(i))));
%     elseif num(i) > 126
%         coded(i) = 32 + (abs(127 - abs(num(i))));
%     else
%         coded(i) = num(i);
%     end
% end
% coded = char(coded);
% end


function txt = caesar(txt,key)
    txt = double(txt) + key;
    first = double(' ');
    last = double('~');
    % use mod to shift the characters - notice the + 1
    % this is a common error and results in shifts 
    % being off by 1
    txt = char(mod(txt - first,last - first + 1) + first);
end


% function y = caesar2(ch, key)
%     v = ' ' : '~';
%     [~, loc] = ismember(ch, v);
%     v2 = circshift(v, -key);
%     y = v2(loc);
% end