class WxWebSocket {
    constructor(url) {
        wx.connectSocket({
            url
        });

        wx.onSocketOpen((ret) => {
            this.onopen && this.onopen(ret);
        });

        wx.onSocketError(err => {
            this.onerror && this.onerror(err);
        });

        wx.onSocketMessage(msg => {
            this.onmessage && this.onmessage(msg);
        });

        wx.onSocketClose(() => {
            this.onclose && this.onclose();
        })
    }

    send(data) {
        wx.sendSocketMessage({
            data
        })
    }

    close() {
        wx.closeSocket();
    }

    onopen() { }
    onerror(error) { }
    onclose() { }
    onmessage(event) { }
}

module.exports = WxWebSocket;
