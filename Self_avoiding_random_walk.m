clear all
clc
prompt = 'Enter the maximum value of length:';
a = input(prompt);
prompt = 'Enter the DNA length:';
dna = input(prompt);
prompt = 'How many times you want to run the code:';
c = input(prompt);
correct=zeros(dna,2);
count = 0;
while count<=c
    count=count+1;%count the number of loops
    d1 = [];%intialise dna1
    d2 = [];%initialise dna2
    cube = zeros(a+1,a+1,a+1);%create a cube
    d1 = randi([0 a],1,3);%Randomly select a starting pt for d1
    cube(d1(1,1)+1,d1(1,2)+1,d1(1,3)+1) = 1;%Mark the pt as occupied
    for i=1:1:dna-1
        t = [];
        tl=[];
        if d1(i,1)==0%if at x start boundary
            t = [t;d1(i,1)+1 d1(i,2) d1(i,3)];
        end
        if d1(i,2)==0%if at y start boundary
            t = [t;d1(i,1) d1(i,2)+1 d1(i,3)];
        end
        if d1(i,3)==0%if at z start boundary
            t = [t;d1(i,1) d1(i,2) d1(i,3)+1];
        end
        if d1(i,1)==a%if at x end boundary
            t = [t;d1(i,1)-1 d1(i,2) d1(i,3)];
        end
        if d1(i,2)==a%if at y end boundary
            t = [t;d1(i,1) d1(i,2)-1 d1(i,3)];
        end
        if d1(i,3)==a%if at z end boundary
            t = [t;d1(i,1) d1(i,2) d1(i,3)-1];
        end
        if d1(i,1)~=0 && d1(i,1)~=a%if not at x boundary
            t = [t;d1(i,1)+1 d1(i,2) d1(i,3)];
            t = [t;d1(i,1)-1 d1(i,2) d1(i,3)];
        end
        if d1(i,2)~=0 && d1(i,2)~=a%if not at y boundary
            t = [t;d1(i,1) d1(i,2)+1 d1(i,3)];
            t = [t;d1(i,1) d1(i,2)-1 d1(i,3)];
        end
        if d1(i,3)~=0 && d1(i,3)~=a%if not at z boundary
            t = [t;d1(i,1) d1(i,2) d1(i,3)+1];
            t = [t;d1(i,1) d1(i,2) d1(i,3)-1];
        end
        for j=1:1:size(t,1)
            if cube(t(j,1)+1,t(j,2)+1,t(j,3)+1) == 1%check if the pt is occupied
                tl = [tl;j];
            end
        end
        t(tl,:) = [];%Delete all the occupied pts
        if length(t)<1
            count=count-1;%decrement the count if invalid dna is created
            break;%discard the invalid dna
        end
        r = randi([1 size(t,1)],1,1);%randomly select a neighbouring pt
        d1 = [d1;t(r,:)];
        cube(d1(i+1,1)+1,d1(i+1,2)+1,d1(i+1,3)+1) = 1;%Mark the pt as occupied
    end
    d2 = randi([0 a],1,3);%Randomly select a starting pt for d2
    while cube(d2(1,1)+1,d2(1,2)+1,d2(1,3)+1) == 1%check if the pt is occupied
        d2 = randi([0 a],1,3);
    end
    cube(d2(1,1)+1,d2(1,2)+1,d2(1,3)+1) = 2;%Mark the pt as occupied
    for i=1:1:dna-1
        t = [];
        tl=[];
        if d2(i,1)==0%if at x start boundary
            t = [t;d2(i,1)+1 d2(i,2) d2(i,3)];
        end
        if d2(i,2)==0%if at y start boundary
            t = [t;d2(i,1) d2(i,2)+1 d2(i,3)];
        end
        if d2(i,3)==0%if at z start boundary
            t = [t;d2(i,1) d2(i,2) d2(i,3)+1];
        end
        if d2(i,1)==a%if at x end boundary
            t = [t;d2(i,1)-1 d2(i,2) d2(i,3)];
        end
        if d2(i,2)==a%if at y end boundary
            t = [t;d2(i,1) d2(i,2)-1 d2(i,3)];
        end
        if d2(i,3)==a%if at x end boundary
            t = [t;d2(i,1) d2(i,2) d2(i,3)-1];
        end
        if d2(i,1)~=0 && d2(i,1)~=a%if not at x boundary
            t = [t;d2(i,1)+1 d2(i,2) d2(i,3)];
            t = [t;d2(i,1)-1 d2(i,2) d2(i,3)];
        end
        if d2(i,2)~=0 && d2(i,2)~=a%if not at y boundary
            t = [t;d2(i,1) d2(i,2)+1 d2(i,3)];
            t = [t;d2(i,1) d2(i,2)-1 d2(i,3)];
        end
        if d2(i,3)~=0 && d2(i,3)~=a%if not at z boundary
            t = [t;d2(i,1) d2(i,2) d2(i,3)+1];
            t = [t;d2(i,1) d2(i,2) d2(i,3)-1];
        end
        for j=1:1:size(t,1)
            if cube(t(j,1)+1,t(j,2)+1,t(j,3)+1) == 1 || cube(t(j,1)+1,t(j,2)+1,t(j,3)+1) == 2%check if the pt is occupied
                tl = [tl;j];
            end
        end
        t(tl,:) = [];%Delete all the occupied pts
        if length(t)<1
            count=count-1;%decrement if invalid dna is created
            break;%discard the dna
        end
        r = randi([1 size(t,1)],1,1);%randomly select a neighbouring pt
        d2 = [d2;t(r,:)];
        cube(d2(i+1,1)+1,d2(i+1,2)+1,d2(i+1,3)+1) = 2;%Mark the pt as occupied
    end
    if size(d1,1)==dna && size(d2,1)==dna
        for i=1:1:dna%check all points of d1 with d2
            t = [];
            tl=[];
            if d1(i,1)==0%if at x start boundary
                t = [t;d1(i,1)+1 d1(i,2) d1(i,3)];
            end
            if d1(i,2)==0%if at y start boundary
                t = [t;d1(i,1) d1(i,2)+1 d1(i,3)];
            end
            if d1(i,3)==0%if at z start boundary
                t = [t;d1(i,1) d1(i,2) d1(i,3)+1];
            end
            if d1(i,1)==a%if at x end boundary
                t = [t;d1(i,1)-1 d1(i,2) d1(i,3)];
            end
            if d1(i,2)==a%if at y end boundary
                t = [t;d1(i,1) d1(i,2)-1 d1(i,3)];
            end
            if d1(i,3)==a%if at z end boundary
                t = [t;d1(i,1) d1(i,2) d1(i,3)-1];
            end
            if d1(i,1)~=0 && d1(i,1)~=a%if not at x boundary
                t = [t;d1(i,1)+1 d1(i,2) d1(i,3)];
                t = [t;d1(i,1)-1 d1(i,2) d1(i,3)];
            end
            if d1(i,2)~=0 && d1(i,2)~=a%if not at y boundary
                t = [t;d1(i,1) d1(i,2)+1 d1(i,3)];
                t = [t;d1(i,1) d1(i,2)-1 d1(i,3)];
            end
            if d1(i,3)~=0 && d1(i,3)~=a%if not at z boundary
                t = [t;d1(i,1) d1(i,2) d1(i,3)+1];
                t = [t;d1(i,1) d1(i,2) d1(i,3)-1];
            end
            
            for j=1:1:size(t,1)
                if cube(t(j,1)+1,t(j,2)+1,t(j,3)+1) == 2%check if the pt is occupied by dna2
                    out = ismember([t(j,1)+1 t(j,2)+1 t(j,3)+1],d2(2,:),'rows');
                    tl = find(out);
                end
            end
            for k=1:1:size(tl,1)
                if i==tl(k)%check if correct contact
                    correct(i,1)=correct(i,1)+1;%increment if correct contact
                else
                    correct(i,2)=correct(i,2)+1;%increment if incorrect contact
                end
            end
        end
    end
end
%correct(:,1)=correct(:,1)/c;%normalizing
%correct(:,2)=correct(:,2)/c;%normalizing
figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
hold on
plot3(d1(:,1),d1(:,2),d1(:,3),'red')
plot3(d2(:,1),d2(:,2),d2(:,3),'green')
hold off
title('DNA')
subplot(2,1,2)       % add second plot in 2 x 1 grid
hb = bar(1:size(d1,1),correct);
set(hb(1),'FaceColor','g')
set(hb(2),'FaceColor','r')
title('Correct Vs Incorrect contact')