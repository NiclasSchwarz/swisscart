var mox={contentLoaded:false,que:[],classes:{},isOpera:(/Opera/gi).test(navigator.userAgent),isSafari:(/Safari|KHTML|Konqueror/gi).test(navigator.userAgent),isGecko:!(/Safari|KHTML|Konqueror/gi).test(navigator.userAgent)&&(/Gecko/gi).test(navigator.userAgent),isIE:(/MSIE/gi).test(navigator.userAgent)&&(/Explorer/gi).test(navigator.appName),baseURL:'',create:function(s,p){var st,cp,bp,co,cn,bcn,m,pm,sn,n,t=this;st= /static\s+/.test(s);s=s.replace(/(static)\s+/,'');s=s.replace(/\s+/,'').split(':');bcn=this.getClassName(s[1]);cn=this.getClassName(s[0]);co=p[cn];this.require(s[1],function(){if(bcn)bp=t.getClass(s[1]).prototype;if(!co){co=p[cn]=function(){if(bp)bp[bcn].apply(this,arguments);};}if(bp){t._inherit(bp,p,bcn,cn);co=p[cn];}cp=co.prototype;if(bp){for(n in bp)cp[n]=bp[n];}for(n in p){if(n=='static'){for(sn in p[n])co[sn]=p[n][sn];}else{if(bp&&bp[n])t._inherit(bp,p,n,n);cp[n]=p[n];}}t.getClass(s[0],st?new co():co);t.provide(s[0]);});},getClass:function(s,cl){var i,l,n,c;for(i=0,s=s.split('.'),l=s.length,c=window;i<l;i++){n=s[i];if(i==l-1){if(cl)c[n]=cl;return c[n];}c=!c[n]?(c[n]={}):c[n];}return null;},getClassName:function(s){return!s?'':s.match(/(^|\.)([a-z0-9_]+)$/i)[2];},log:function(){var d=mox.devkit,c=window.console,a=arguments;if(d)d.DevKit.log.apply(d.DevKit,a);if(c&&c.debug&&!this.isSafari)c.debug(a.length==1?a[0]:a);},bind:function(s,f){return typeof(f)=='function'?function(){return f.apply(s,arguments);}:null;},findBaseURL:function(k){var i,nl=document.getElementsByTagName('script'),n;k=!k?'mox.js':k;for(i=0;i<nl.length;i++){n=nl[i];if(n.src&&n.src.indexOf(k)!=-1)return this.baseURL=n.src.substring(0,n.src.lastIndexOf('/'));}return null;},require:function(f,cb){var i,o=[];if(!f){if(cb)cb();return;}if(typeof(f)=='string')f=[f];for(i=0;i<f.length;i++){if(!this.getClass(f[i]))o.push(f[i]);}if(cb){if(o.length==0)cb();else this.que.push({classes:o,count:0,callback:cb});}this.loadClasses(o);},provide:function(c){var i,y,q,cl,cb=[];if(this.classes[c]>1)return;this.classes[c]=2;for(i=0,q=this.que;i<q.length;i++){if(q[i]){for(y=0,cl=q[i].classes;y<cl.length;y++){if(cl[y]==c)q[i].count++;}if(q[i].count>=q[i].classes.length){cb.push(q[i].callback);q[i]=null;}}}for(i=0;i<cb.length;i++)cb[i]();},loadClasses:function(cl){var d=document,s,i,c;for(i=0;i<cl.length;i++){c=cl[i];if(this.classes[c]>0)continue;this.classes[c]=1;s=d.createElement('script');s.setAttribute('type','text/javascript');s.setAttribute('src',this.baseURL+'/'+c.toLowerCase().replace(/\./g,'/')+'.js');d.getElementsByTagName('head')[0].appendChild(s);}},_inherit:function(bp,p,bn,n){var m=p[n],pm=bp[bn];p[n]=function(){this.parent=pm;return m.apply(this,arguments);};},_pageInit:function(){if(this.isIE&&!/https/gi.test(document.location.protocol)){document.write('<script id=__ie_onload defer src=javascript:void(0)><\/script>');document.getElementById("__ie_onload").onreadystatechange=mox._pageDone;}},_pageDone:function(){if(this.readyState=="complete")mox.contentLoaded=true;}};if(mox.isGecko){window.addEventListener('DOMContentLoaded',function(){mox.contentLoaded=true;},false);};mox._pageInit();mox.findBaseURL();mox.loadClasses=function(cl){var d=document,s,o=[],i,u;if(cl.length==0)return;for(i=0;i<cl.length;i++){if(!this.classes[cl[i]]){this.classes[cl[i]]=1;o.push(cl[i]);}}if(o.length==0)return;u=this.baseURL+'/compressor.php?classes='+o.join(',');if(mox.isIE){try{s=new ActiveXObject("Microsoft.XMLHTTP");}catch(ex){s=new ActiveXObject("Msxml2.XMLHTTP");}s.open("GET",u.replace(/%2C/g,','),false);s.send(null);this.scriptData=s.responseText;document.write('<script type="text/javascript">eval(mox.scriptData);mox.scriptData=null;</script>');}else{s=d.createElement('script');s.setAttribute('type','text/javascript');s.setAttribute('src',u);d.getElementsByTagName('head')[0].appendChild(s);}};mox.baseURL='/admin/includes/javascript/tiny_mce/plugins/imagemanager/js';mox.defaultDoc='index.php';