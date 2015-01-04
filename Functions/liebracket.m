function ad_fng = lie(f,g,x,n)

ad_fng = sym(zeros(length(f),n+1));
ad_fng(:,1) = g;

if n>0
    for t = 2:n+1
        ad_fng(:,t) = jacobian(ad_fng(:,t-1) ,x)*f - jacobian(f,x)*ad_fng(:,t-1);
    end
end

ad_fng = expand(ad_fng);

