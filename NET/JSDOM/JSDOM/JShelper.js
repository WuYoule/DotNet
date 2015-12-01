//dom提供insertBefore()方法，这个方法将把一个新元素插入到一个现有元素的前面
// insertAfter()
function insertAfter(newElement, targetElement) {
    var parent = targetElement.parentNode;
    if (parent.lastChild == targetElement) {
        parent.appendChild(newElement);
    }
    else {
        parent.insertBefore(newElement, targetElement.nextSibling);
    }
}

function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
        window.onload = func;
    }
    else {
        window.onload = function () {
            oldonload();
            func();
        }
    }
}
function getHTTPObject() {
    if (typeof XMLHttpRequest =="undefined") {
        XMLHttpRequest = function () {
            try {
                return new ActiveXObject("Msxml2.XMLHTTP.6.0");
            } catch (e) {
            }
            try {
                return new ActiveXObject("Msxml2.XMLHTTP.3.0");
            } catch (e) {

            }
            try {
                return new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {

            }
            return false;
        }
        return new XMLHttpRequest();
    }
}