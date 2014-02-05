input metaobj;
%input metauml;
input TEX;
prologues:=3;
outputformat := "eps";
outputtemplate := "%j-%c.eps";
TEXPRE("%&latex" & char(10) & "\documentclass{article}\usepackage{pbox}\usepackage{makebox}\begin{document}");
TEXPOST("\end{document}");
show_empty_boxes:=true;

beginfig(1);

newBox.a(btex\strut$\cdots$ etex);
newBox.ni(btex\strut$n_i$ etex);
newBox.di(btex\strut$d_i$ etex);
newBox.ni1(btex\strut$n_{i+1}$ etex);
newBox.di1(btex\strut$d_{i+1}$ etex);
newBox.aa(btex\strut$\cdots$ etex);
newBox.nk(btex\strut$n_k$ etex);
newBox.dk(btex\strut$d_k$ etex);

newHBox.band(a,ni,di,ni1,di1,aa,nk,dk) "framed(true)", "hbsep(0)";
band.nw = origin;

newBox.bd(btex $\vdots$ etex) "fit(false)";
h = abs((ypart bd.n) - (ypart bd.s));
w = abs((xpart bd.w) - (xpart bd.e));
newEmptyBox.be(h,w) "framed(true)";
newEmptyBox.ba(h,w) "framed(true)";
newEmptyBox.bb(h,w) "framed(true)";
newEmptyBox.bc(h,w) "framed(true)";
newEmptyBox.bf(h,w) "framed(true)";

newVBox.vband(ba, bb, bc, bd, be, bf) "framed(true)", "vbsep(0)", "flip(true)";
vband.ne = band.sw + (-20,-10);

newEmptyBox.nda1(h,w) "framed(true)";
newEmptyBox.nda2(h,w) "framed(true)";
newEmptyBox.nda3(h,w) "framed(true)";
newVBox.vnda(nda1,nda2,nda3) "framed(true)", "vbsep(0)", "flip(true)";

scaleObj(vnda, 0.5);
nda1.w = (xpart band.w, ypart bb.e);
addUserPath.nda1(nda1.c{right}..{curl0}ni.c cutafter BpathBox(ni));
addUserPath.nda2(nda2.c{right}..{curl0}di.c cutafter BpathBox(di));

newEmptyBox.ndb1(h,w) "framed(true)";
newEmptyBox.ndb2(h,w) "framed(true)";
newEmptyBox.ndb3(h,w) "framed(true)";
newVBox.vndb(ndb1,ndb2,ndb3) "framed(true)", "vbsep(0)", "flip(true)";

scaleObj(vndb, 0.5);
ndb1.w = nda3.e + (20,0);
addUserPath.ndb1(ndb1.c{right}..{curl0}nk.c cutafter BpathBox(nk));
addUserPath.ndb2(ndb2.c{right}..{curl0}dk.c cutafter BpathBox(dk));

newEmptyBox.ndc1(h,w) "framed(true)";
newEmptyBox.ndc2(h,w) "framed(true)";
newEmptyBox.ndc3(h,w) "framed(true)";
newVBox.vndc(ndc1,ndc2,ndc3) "framed(true)", "vbsep(0)", "flip(true)";

scaleObj(vndc, 0.5);
ndc1.w = (xpart vndb.w, ypart be.e);
addUserPath.ndc1(ndc1.c{right}..{curl0}ni1.c cutafter BpathBox(ni1));
addUserPath.ndc2(ndc2.c{right}..{curl0}di1.c cutafter BpathBox(di1));

ncline.vband(bb.c)(nda1.w);
ncline.vnda(nda3.c)(ndb1.w);
ncline.vband(be.c)(ndc1.w);

newEmptyBox.ptr(0,0);
ptr.c = (xpart aa.c, ypart ndc1.ne);
addUserPath.ptr(subpath (0,.7) of (ptr.c..{left}ndc3.c)) "linestyle(dashed evenly)", "name(dashedpointer)";
ObjLabel.ptr(btex \strut ndblock etex) "labdir(rt)";
ObjLabel.band(btex \strut ndlabel: etex) "labdir(lft)", "labpoint(w)";
ObjLabel.ba(btex \strut hashtab: etex) "labdir(lft)", "labpoint(w)";

drawObj(ptr);
drawObj(vband);
drawObj(vnda);
drawObj(vndb);
drawObj(vndc);
drawObj(band);

endfig;
end;
