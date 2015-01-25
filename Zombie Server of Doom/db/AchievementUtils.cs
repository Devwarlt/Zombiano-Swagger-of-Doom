using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ionic.Zlib;
using Newtonsoft.Json;

namespace db
{
    public static class AchievementUtils
    {
        public static List<AchievementStruct> DeserializeFromEncryptedBase64String(string value)
        {
            if (String.IsNullOrWhiteSpace(value)) return new List<AchievementStruct>();
            var json = ZlibStream.UncompressString(Convert.FromBase64String(value));
            var data = JsonConvert.DeserializeObject<achievementString>(json);

            return data.data;
        }

        public static string SerializeToEncryptedBase64String(List<AchievementStruct> list)
        {
            var data = new achievementString();
            data.len = list.Count;
            data.data = list;

            var json = JsonConvert.SerializeObject(data);
            var base64 = Convert.ToBase64String(ZlibStream.CompressString(json));

            return base64;
        }

        private class achievementString
        {
            public int len;
            public List<AchievementStruct> data;
        }

        public class AchievementStruct
        {
            [JsonProperty("id")]
            public int AchievementId;
            [JsonProperty("completed")]
            public int CompletedAt;
        }
    }
}
