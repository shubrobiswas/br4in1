function ad = lie(f,g,x,n)

ad = sym(zeros(length(f),n+1));
ad(:,1) = g;

if n>0
    for t = 2:n+1
        ad(:,t) = jacobian(ad(:,t-1) ,x)*f - jacobian(f,x)*ad(:,t-1);
    end
end

ad = expand(ad);

