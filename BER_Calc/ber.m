function [ber,bsr] = ber(data)
ber=0;bsr=0;ber_c=0;bsr_c=0;
   for v = 1:1:length(data)
    if data(1,v) == 1
            bsr_c=bsr_c+1;
        elseif data(1,v) ~= 1
            ber_c=ber_c+1;
    end
   end
 ber=ber_c/length(data);
 bsr=bsr_c/length(data);
end