(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[8247],{28045:function(e,t,n){"use strict";function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=[],r=!0,i=!1,o=void 0;try{for(var a,c=e[Symbol.iterator]();!(r=(a=c.next()).done)&&(n.push(a.value),!t||n.length!==t);r=!0);}catch(l){i=!0,o=l}finally{try{r||null==c.return||c.return()}finally{if(i)throw o}}return n}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance")}()}function o(e){return function(e){if(Array.isArray(e)){for(var t=0,n=new Array(e.length);t<e.length;t++)n[t]=e[t];return n}}(e)||function(e){if(Symbol.iterator in Object(e)||"[object Arguments]"===Object.prototype.toString.call(e))return Array.from(e)}(e)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance")}()}t.default=function(e){var t=e.src,n=e.sizes,o=e.unoptimized,u=void 0!==o&&o,d=e.priority,f=void 0!==d&&d,m=e.loading,b=e.lazyBoundary,w=void 0===b?"200px":b,A=e.className,k=e.quality,x=e.width,S=e.height,z=e.objectFit,I=e.objectPosition,L=e.onLoadingComplete,_=e.loader,R=void 0===_?O:_,M=e.placeholder,P=void 0===M?"empty":M,C=e.blurDataURL,D=function(e,t){if(null==e)return{};var n,r,i=function(e,t){if(null==e)return{};var n,r,i={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}(e,["src","sizes","unoptimized","priority","loading","lazyBoundary","className","quality","width","height","objectFit","objectPosition","onLoadingComplete","loader","placeholder","blurDataURL"]),q=n?"responsive":"intrinsic";"layout"in D&&(D.layout&&(q=D.layout),delete D.layout);var N="";if(function(e){return"object"===typeof e&&(y(e)||function(e){return void 0!==e.src}(e))}(t)){var U=y(t)?t.default:t;if(!U.src)throw new Error("An object should only be passed to the image component src parameter if it comes from a static image import. It must include src. Received ".concat(JSON.stringify(U)));if(C=C||U.blurDataURL,N=U.src,(!q||"fill"!==q)&&(S=S||U.height,x=x||U.width,!U.height||!U.width))throw new Error("An object should only be passed to the image component src parameter if it comes from a static image import. It must include height and width. Received ".concat(JSON.stringify(U)))}t="string"===typeof t?t:N;var B=j(x),T=j(S),W=j(k),H=!f&&("lazy"===m||"undefined"===typeof m);(t.startsWith("data:")||t.startsWith("blob:"))&&(u=!0,H=!1);h.has(t)&&(H=!1);0;var K,F=i(s.useIntersection({rootMargin:w,disabled:!H}),2),V=F[0],J=F[1],G=!H||J,Q={boxSizing:"border-box",display:"block",overflow:"hidden",width:"initial",height:"initial",background:"none",opacity:1,border:0,margin:0,padding:0},X={boxSizing:"border-box",display:"block",width:"initial",height:"initial",background:"none",opacity:1,border:0,margin:0,padding:0},Y=!1,Z={position:"absolute",top:0,left:0,bottom:0,right:0,boxSizing:"border-box",padding:0,border:"none",margin:"auto",display:"block",width:0,height:0,minWidth:"100%",maxWidth:"100%",minHeight:"100%",maxHeight:"100%",objectFit:z,objectPosition:I},$="blur"===P?{filter:"blur(20px)",backgroundSize:z||"cover",backgroundImage:'url("'.concat(C,'")'),backgroundPosition:I||"0% 0%"}:{};if("fill"===q)Q.display="block",Q.position="absolute",Q.top=0,Q.left=0,Q.bottom=0,Q.right=0;else if("undefined"!==typeof B&&"undefined"!==typeof T){var ee=T/B,te=isNaN(ee)?"100%":"".concat(100*ee,"%");"responsive"===q?(Q.display="block",Q.position="relative",Y=!0,X.paddingTop=te):"intrinsic"===q?(Q.display="inline-block",Q.position="relative",Q.maxWidth="100%",Y=!0,X.maxWidth="100%",K='<svg width="'.concat(B,'" height="').concat(T,'" xmlns="http://www.w3.org/2000/svg" version="1.1"/>')):"fixed"===q&&(Q.display="inline-block",Q.position="relative",Q.width=B,Q.height=T)}else 0;var ne={src:g,srcSet:void 0,sizes:void 0};G&&(ne=E({src:t,unoptimized:u,layout:q,width:B,quality:W,sizes:n,loader:R}));var re=t;0;0;var ie=(r(v={},"imagesrcset",ne.srcSet),r(v,"imagesizes",ne.sizes),v);return a.default.createElement("span",{style:Q},Y?a.default.createElement("span",{style:X},K?a.default.createElement("img",{style:{display:"block",maxWidth:"100%",width:"initial",height:"initial",background:"none",opacity:1,border:0,margin:0,padding:0},alt:"","aria-hidden":!0,src:"data:image/svg+xml;base64,".concat(l.toBase64(K))}):null):null,a.default.createElement("img",Object.assign({},D,ne,{decoding:"async","data-nimg":q,className:A,ref:function(e){V(e),function(e,t,n,r,i){if(!e)return;var o=function(){e.src!==g&&("decode"in e?e.decode():Promise.resolve()).catch((function(){})).then((function(){if("blur"===r&&(e.style.filter="none",e.style.backgroundSize="none",e.style.backgroundImage="none"),h.add(t),i){var n=e.naturalWidth,o=e.naturalHeight;i({naturalWidth:n,naturalHeight:o})}}))};e.complete?o():e.onload=o}(e,re,0,P,L)},style:p({},Z,$)})),a.default.createElement("noscript",null,a.default.createElement("img",Object.assign({},D,E({src:t,unoptimized:u,layout:q,width:B,quality:W,sizes:n,loader:R}),{decoding:"async","data-nimg":q,style:Z,className:A,loading:m||"lazy"}))),f?a.default.createElement(c.default,null,a.default.createElement("link",Object.assign({key:"__nimg-"+ne.src+ne.srcSet+ne.sizes,rel:"preload",as:"image",href:ne.srcSet?void 0:ne.src},ie))):null)};var a=f(n(67294)),c=f(n(5443)),l=n(86978),u=n(5809),s=n(57190);function d(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function f(e){return e&&e.__esModule?e:{default:e}}function p(e){for(var t=arguments,n=function(n){var r=null!=t[n]?t[n]:{},i=Object.keys(r);"function"===typeof Object.getOwnPropertySymbols&&(i=i.concat(Object.getOwnPropertySymbols(r).filter((function(e){return Object.getOwnPropertyDescriptor(r,e).enumerable})))),i.forEach((function(t){d(e,t,r[t])}))},r=1;r<arguments.length;r++)n(r);return e}var h=new Set,g=(new Map,"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7");var m=new Map([["default",function(e){var t=e.root,n=e.src,r=e.width,i=e.quality;0;return"".concat(t,"?url=").concat(encodeURIComponent(n),"&w=").concat(r,"&q=").concat(i||75)}],["imgix",function(e){var t=e.root,n=e.src,r=e.width,i=e.quality,o=new URL("".concat(t).concat(z(n))),a=o.searchParams;a.set("auto",a.get("auto")||"format"),a.set("fit",a.get("fit")||"max"),a.set("w",a.get("w")||r.toString()),i&&a.set("q",i.toString());return o.href}],["cloudinary",function(e){var t=e.root,n=e.src,r=e.width,i=e.quality,o=["f_auto","c_limit","w_"+r,"q_"+(i||"auto")].join(",")+"/";return"".concat(t).concat(o).concat(z(n))}],["akamai",function(e){var t=e.root,n=e.src,r=e.width;return"".concat(t).concat(z(n),"?imwidth=").concat(r)}],["custom",function(e){var t=e.src;throw new Error('Image with src "'.concat(t,'" is missing "loader" prop.')+"\nRead more: https://nextjs.org/docs/messages/next-image-missing-loader")}]]);function y(e){return void 0!==e.default}var v,b={deviceSizes:[640,750,828,1080,1200,1920,2048,3840],imageSizes:[16,32,48,64,96,128,256,384],path:"/_next/image",loader:"default"}||u.imageConfigDefault,w=b.deviceSizes,A=b.imageSizes,k=b.loader,x=b.path,S=(b.domains,o(w).concat(o(A)));function E(e){var t=e.src,n=e.unoptimized,r=e.layout,i=e.width,a=e.quality,c=e.sizes,l=e.loader;if(n)return{src:t,srcSet:void 0,sizes:void 0};var u=function(e,t,n){if(n&&("fill"===t||"responsive"===t)){for(var r,i=/(^|\s)(1?\d?\d)vw/g,a=[];r=i.exec(n);r)a.push(parseInt(r[2]));if(a.length){var c,l=.01*(c=Math).min.apply(c,o(a));return{widths:S.filter((function(e){return e>=w[0]*l})),kind:"w"}}return{widths:S,kind:"w"}}return"number"!==typeof e||"fill"===t||"responsive"===t?{widths:w,kind:"w"}:{widths:o(new Set([e,2*e].map((function(e){return S.find((function(t){return t>=e}))||S[S.length-1]})))),kind:"x"}}(i,r,c),s=u.widths,d=u.kind,f=s.length-1;return{sizes:c||"w"!==d?c:"100vw",srcSet:s.map((function(e,n){return"".concat(l({src:t,quality:a,width:e})," ").concat("w"===d?e:n+1).concat(d)})).join(", "),src:l({src:t,quality:a,width:s[f]})}}function j(e){return"number"===typeof e?e:"string"===typeof e?parseInt(e,10):void 0}function O(e){var t=m.get(k);if(t)return t(p({root:x},e));throw new Error('Unknown "loader" found in "next.config.js". Expected: '.concat(u.VALID_LOADERS.join(", "),". Received: ").concat(k))}function z(e){return"/"===e[0]?e.slice(1):e}w.sort((function(e,t){return e-t})),S.sort((function(e,t){return e-t}))},48418:function(e,t,n){"use strict";function r(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=[],r=!0,i=!1,o=void 0;try{for(var a,c=e[Symbol.iterator]();!(r=(a=c.next()).done)&&(n.push(a.value),!t||n.length!==t);r=!0);}catch(l){i=!0,o=l}finally{try{r||null==c.return||c.return()}finally{if(i)throw o}}return n}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance")}()}t.default=void 0;var i,o=(i=n(67294))&&i.__esModule?i:{default:i},a=n(76273),c=n(90387),l=n(57190);var u={};function s(e,t,n,r){if(e&&a.isLocalURL(t)){e.prefetch(t,n,r).catch((function(e){0}));var i=r&&"undefined"!==typeof r.locale?r.locale:e&&e.locale;u[t+"%"+n+(i?"%"+i:"")]=!0}}var d=function(e){var t,n=!1!==e.prefetch,i=c.useRouter(),d=o.default.useMemo((function(){var t=r(a.resolveHref(i,e.href,!0),2),n=t[0],o=t[1];return{href:n,as:e.as?a.resolveHref(i,e.as):o||n}}),[i,e.href,e.as]),f=d.href,p=d.as,h=e.children,g=e.replace,m=e.shallow,y=e.scroll,v=e.locale;"string"===typeof h&&(h=o.default.createElement("a",null,h));var b=(t=o.default.Children.only(h))&&"object"===typeof t&&t.ref,w=r(l.useIntersection({rootMargin:"200px"}),2),A=w[0],k=w[1],x=o.default.useCallback((function(e){A(e),b&&("function"===typeof b?b(e):"object"===typeof b&&(b.current=e))}),[b,A]);o.default.useEffect((function(){var e=k&&n&&a.isLocalURL(f),t="undefined"!==typeof v?v:i&&i.locale,r=u[f+"%"+p+(t?"%"+t:"")];e&&!r&&s(i,f,p,{locale:t})}),[p,f,k,v,n,i]);var S={ref:x,onClick:function(e){t.props&&"function"===typeof t.props.onClick&&t.props.onClick(e),e.defaultPrevented||function(e,t,n,r,i,o,c,l){("A"!==e.currentTarget.nodeName||!function(e){var t=e.currentTarget.target;return t&&"_self"!==t||e.metaKey||e.ctrlKey||e.shiftKey||e.altKey||e.nativeEvent&&2===e.nativeEvent.which}(e)&&a.isLocalURL(n))&&(e.preventDefault(),null==c&&r.indexOf("#")>=0&&(c=!1),t[i?"replace":"push"](n,r,{shallow:o,locale:l,scroll:c}))}(e,i,f,p,g,m,y,v)},onMouseEnter:function(e){t.props&&"function"===typeof t.props.onMouseEnter&&t.props.onMouseEnter(e),a.isLocalURL(f)&&s(i,f,p,{priority:!0})}};if(e.passHref||"a"===t.type&&!("href"in t.props)){var E="undefined"!==typeof v?v:i&&i.locale,j=i&&i.isLocaleDomain&&a.getDomainLocale(p,E,i&&i.locales,i&&i.domainLocales);S.href=j||a.addBasePath(a.addLocale(p,E,i&&i.defaultLocale))}return o.default.cloneElement(t,S)};t.default=d},57190:function(e,t,n){"use strict";function r(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=[],r=!0,i=!1,o=void 0;try{for(var a,c=e[Symbol.iterator]();!(r=(a=c.next()).done)&&(n.push(a.value),!t||n.length!==t);r=!0);}catch(l){i=!0,o=l}finally{try{r||null==c.return||c.return()}finally{if(i)throw o}}return n}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance")}()}Object.defineProperty(t,"__esModule",{value:!0}),t.useIntersection=function(e){var t=e.rootMargin,n=e.disabled||!a,l=i.useRef(),u=r(i.useState(!1),2),s=u[0],d=u[1],f=i.useCallback((function(e){l.current&&(l.current(),l.current=void 0),n||s||e&&e.tagName&&(l.current=function(e,t,n){var r=function(e){var t=e.rootMargin||"",n=c.get(t);if(n)return n;var r=new Map,i=new IntersectionObserver((function(e){e.forEach((function(e){var t=r.get(e.target),n=e.isIntersecting||e.intersectionRatio>0;t&&n&&t(n)}))}),e);return c.set(t,n={id:t,observer:i,elements:r}),n}(n),i=r.id,o=r.observer,a=r.elements;return a.set(e,t),o.observe(e),function(){a.delete(e),o.unobserve(e),0===a.size&&(o.disconnect(),c.delete(i))}}(e,(function(e){return e&&d(e)}),{rootMargin:t}))}),[n,t,s]);return i.useEffect((function(){if(!a&&!s){var e=o.requestIdleCallback((function(){return d(!0)}));return function(){return o.cancelIdleCallback(e)}}}),[s]),[f,s]};var i=n(67294),o=n(9311),a="undefined"!==typeof IntersectionObserver;var c=new Map},86978:function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.toBase64=function(e){return window.btoa(e)}},5809:function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.imageConfigDefault=t.VALID_LOADERS=void 0;t.VALID_LOADERS=["default","imgix","cloudinary","akamai","custom"];t.imageConfigDefault={deviceSizes:[640,750,828,1080,1200,1920,2048,3840],imageSizes:[16,32,48,64,96,128,256,384],path:"/_next/image",loader:"default",domains:[],disableStaticImages:!1,minimumCacheTTL:60,formats:["image/webp"]}},9008:function(e,t,n){e.exports=n(5443)},25675:function(e,t,n){e.exports=n(28045)},41664:function(e,t,n){e.exports=n(48418)}}]);