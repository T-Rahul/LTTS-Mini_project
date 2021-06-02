sp=7;   % No of speakers
sath = reshape(s1',1 ,num_coeff);
rah = reshape(r1',1 ,num_coeff);
ani = reshape(an1',1 ,num_coeff);
char = reshape(c1',1 ,num_coeff);
ked =reshape(k1',1 ,num_coeff);
pav =reshape(p1',1 ,num_coeff);
sk  =reshape(sk1',1 ,num_coeff);

M = [sath; rah; ani; char; ked; pav; sk];
y2 = reshape(m1', 1, num_coeff);
k = zeros(sp, 1);
for i=1:sp
    k(i, 1) = sqrt(dot(M(i, :)-y2, M(i, :)-y2));
end
k=k';
disp(k);