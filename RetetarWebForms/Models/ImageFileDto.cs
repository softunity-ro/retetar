using RetetarWebForms.Constants;

namespace RetetarWebForms.Models
{
    public class ImageFileDto
    {
        public int Id { get; set; }

        public string LocalFilePath { get; set; }

        public string WebPath => FilePaths.ImageCategory + FileNameOnly;

        public string FileNameOnly => string.IsNullOrWhiteSpace(LocalFilePath)
            ? ""
            : LocalFilePath.Substring(LocalFilePath.LastIndexOf("\\") + 1);
    }
}